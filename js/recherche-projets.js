/**
 * recherche-projets.js - Filtrage dynamique des projets par mots-clés et catégories
 */

document.addEventListener('DOMContentLoaded', () => {
    const searchInput = document.getElementById('projectSearchInput');
    const filterButtons = document.querySelectorAll('.filter-btn');
    const projectCards = document.querySelectorAll('.project-card-wrapper');
    const noResults = document.getElementById('noProjectsFound');

    let currentCategory = 'all';
    let currentSearchTerm = '';

    function filterProjects() {
        let visibleCount = 0;

        projectCards.forEach(card => {
            const category = card.getAttribute('data-category') || '';
            const title = card.getAttribute('data-title') || '';
            const tags = card.getAttribute('data-tags') || '';
            const description = card.querySelector('.project-desc')?.textContent || '';

            const contentText = `${title} ${tags} ${description}`.toLowerCase();

            const matchesCategory = (currentCategory === 'all' || category.toLowerCase() === currentCategory.toLowerCase());
            const matchesSearch = contentText.includes(currentSearchTerm.toLowerCase());

            if (matchesCategory && matchesSearch) {
                card.style.display = 'block';
                card.style.animation = 'fadeIn 0.4s ease';
                visibleCount++;
            } else {
                card.style.display = 'none';
            }
        });

        if (noResults) {
            noResults.style.display = visibleCount === 0 ? 'block' : 'none';
        }
    }

    // Event listener pour la barre de recherche
    if (searchInput) {
        searchInput.addEventListener('input', (e) => {
            currentSearchTerm = e.target.value.trim();
            filterProjects();
        });
    }

    // Event listeners pour les boutons de catégorie
    filterButtons.forEach(btn => {
        btn.addEventListener('click', () => {
            filterButtons.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');

            currentCategory = btn.getAttribute('data-filter') || 'all';
            filterProjects();
        });
    });
});
