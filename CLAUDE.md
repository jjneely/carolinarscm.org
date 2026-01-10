# RSCM Carolina Summer Choral Residency Website

This is the official website for the Royal School of Church Music in America (RSCMA) Carolina Summer Choral Residency, hosted at http://carolinarscm.org.

## Project Overview

This is a custom Hugo static site for an annual summer choral course held at Duke University. The course has been running since 1996 and features internationally recognized musicians leading sacred choral music training for choristers and church musicians.

## Technology Stack

- **Static Site Generator**: Hugo (recently ported to modern Hugo from v0.15)
- **Deployment**: Google Cloud Storage (gs://carolinarscm.org/)
- **Markup**: YAML frontmatter, Markdown content
- **Configuration**: config.yaml

## Site Structure

### Content Organization

The site has four main content areas:

1. **About** (`content/about/`) - Information about the course, RSCM, leadership, and daily life
2. **News** (`content/news/`) - Announcements, updates, and course information (news posts)
3. **Courses** (`content/courses/`) - Historical archive of past courses (1996-present)
4. **Registration** (`content/register.md`) - Single page with registration details and forms
5. **Contact** (`content/contact.md`) - Contact information

### Frontmatter Patterns

**About Pages**:
```yaml
---
title: Page Title
author: jjneely
date: YYYY-MM-DD
menu:
  main:
    parent: About
    weight: -50
---
```

**News Posts**:
```yaml
---
title: 'Post Title'
author: jjneely
layout: post
date: YYYY-MM-DD
categories:
  - Uncategorized
---
```

**Course Archive Pages**:
```yaml
---
title: "YYYY"
date: YYYY-MM-DD
layout: current
menu:
  main:
    parent: Past Courses
staff:
  list:
  - img: /images/people/filename.ext
    name: Person Name
    position: Role Title
---
```

### Static Assets

- **CSS**: `static/css/`
- **Images**: `static/images/` (includes people headshots in `static/images/people/`)
- **PDFs**: `static/pdf/` (course materials, music lists, etc.)
- **Fonts**: `static/fonts/`
- **JavaScript**: `static/js/`

### Custom Elements

**Shortcodes** (in `layouts/shortcodes/`):
- `{{% figure src="/path/to/image.jpg" alt="Description" %}}` - Display images
- `{{% staff %}}` - Render staff list from course frontmatter

**Custom Layouts**:
- `layouts/index.html` - Homepage with news feed
- `layouts/courses/` - Course archive templates
- `layouts/about/` - About section templates
- `layouts/section/` - Section listing pages

## Configuration (config.yaml)

Important configuration parameters:

- **current**: The current course year (update annually)
- **dateline**: Display message about current course dates
- **maxnews**: Number of news items to show on homepage (default: 4)

Menu structure is defined in config.yaml with hierarchical parent-child relationships.

## Development

### Local Development
```bash
hugo server -w
```

### Build and Deploy

**Production deployment**:
```bash
make production
```
This builds the site and syncs to `gs://carolinarscm.org/`

**Test deployment**:
```bash
make test
```
This builds with test base URL and syncs to `gs://test.carolinarscm.org/`

Note: The Makefile references `hugo-0.15` as a legacy default but the site has been ported to modern Hugo. Set the `HUGO` environment variable to override: `HUGO=hugo make production`

## Common Tasks

### Adding a News Post

1. Create a new file in `content/news/YYYY-descriptive-title.md`
2. Use the news post frontmatter pattern
3. Include images using the `figure` shortcode if needed
4. Images should be placed in `static/images/` or `static/images/people/` for headshots

### Updating for a New Course Year

1. Update `config.yaml`:
   - Set `current: YYYY` to the new year
   - Update `dateline` with new course dates
   - Update `copyright` year
2. Create new course page in `content/courses/YYYY.md`
3. Add staff list to course frontmatter
4. Add headshot images to `static/images/people/`
5. Create news posts announcing directors, organists, and other staff
6. Update registration page if needed

### Adding Staff/Director Announcements

Staff announcements are typically news posts with:
- A headshot image in `static/images/people/`
- Biography and credentials
- Reference to their role for the current year

### Course Archive Pages

Each year's course page (`content/courses/YYYY.md`) should include:
- Staff list in frontmatter with headshot images
- Layout set to `current`
- Properly set in menu hierarchy under "Past Courses"

## Important Notes

- The site uses custom HTML in markdown (unsafe rendering is enabled)
- Many legacy images are in `/wp-content/uploads/` from previous WordPress site
- PDF music lists and materials go in `static/pdf/`
- The site has a long history (1996-present) with significant archival content
- Course typically runs late June/early July annually at Duke University
- Uses reference-style markdown links for cleaner content

## Git Workflow

- Main branch: `master`
- Current untracked: `.hugo_build.lock` (Hugo build artifact, safe to ignore)

## External Links

- RSCM America: http://www.rscmamerica.org
- RSCM International: http://www.rscm.com
- Central NC AGO: http://www.agohq.org/chapters/centralnc/
