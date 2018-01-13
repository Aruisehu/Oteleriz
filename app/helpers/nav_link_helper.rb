module NavLinkHelper
    def nav_path(name, path)
        return link_to name, path, class: request.env['PATH_INFO'] == path ? "active" : "" 
    end
end
