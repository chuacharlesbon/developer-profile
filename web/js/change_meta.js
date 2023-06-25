function changeMeta() {
    let $metaOgTitle = document.querySelector('meta[property="og:title"]')
    let $metaDescription = document.querySelector('meta[name="description"]')
    // If a <link rel="icon"> element already exists,
    // change its href to the given link.
    if ($metaOgTitle !== null) {
        $metaOgTitle.content = 'Full Stack Developer - Profile'
        // Otherwise, create a new element and append it to <head>.
    } else {
        $metaOgTitle = document.createElement("meta")
        $metaOgTitle.property = "og:title"
        $metaOgTitle.content = 'Full Stack Developer - Profile'
        document.head.appendChild($metaOgTitle)
    }

    if ($metaDescription !== null) {
        $metaDescription.content = 'Full Stack Developer - Profile'
        // Otherwise, create a new element and append it to <head>.
    } else {
        $metaDescription = document.createElement("meta")
        $metaDescription.name = "description"
        $metaDescription.content = 'Developer Portfolio - Charles Bon Chua: Full Stack Developer; Frontend React and Flutter, Backend Nodejs'
        document.head.appendChild($metaDescription)
    }
}