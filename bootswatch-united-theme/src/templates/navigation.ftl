<div class="navbar navbar-default navbar-fixed-top" id="navigation" role="navigation">
    <h1 class="hide-accessible"><@liferay.language key="navigation" /></h1>
    <div class="container">
        <div class="navbar-header">
            <#if show_site_name>
            <a class="navbar-brand" href="${site_default_url}"
               title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
                ${site_name}
            </a>
            </#if>
            <button class="navbar-toggle" type="button" data-toggle="collapse"
                    data-target="#navbar-main">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="navbar-collapse collapse" id="navbar-main">
            <ul aria-label="<@liferay.language key="site-pages" />"
                role="menubar"
                class="nav navbar-nav">
                <#list nav_items as nav_item>
                    <#assign
                    nav_item_attr_has_popup = ""
                    nav_item_attr_selected = ""
                    nav_item_css_class = ""
                    nav_item_layout = nav_item.getLayout()
                    />

                    <#if nav_item.isSelected()>
                        <#assign
                        nav_item_attr_has_popup = "aria-haspopup='true'"
                        nav_item_attr_selected = "aria-selected='true'"
                        nav_item_css_class = "selected"
                        />
                    </#if>

                    <li ${nav_item_attr_selected} class="${nav_item_css_class}"
                                                  id="layout_${nav_item.getLayoutId()}"
                                                  role="presentation">
                        <a aria-labelledby="layout_${nav_item.getLayoutId()}" ${nav_item_attr_has_popup}
                           href="${nav_item.getURL()}" ${nav_item.getTarget()}
                           role="menuitem"><span><@liferay_theme["layout-icon"] layout=nav_item_layout /> ${nav_item.getName()}</span></a>

                        <#if nav_item.hasChildren()>
                            <ul class="child-menu" role="menu">
                                <#list nav_item.getChildren() as nav_child>
                                    <#assign
                                    nav_child_attr_selected = ""
                                    nav_child_css_class = ""
                                    />

                                    <#if nav_item.isSelected()>
                                        <#assign
                                        nav_child_attr_selected = "aria-selected='true'"
                                        nav_child_css_class = "selected"
                                        />
                                    </#if>

                                    <li ${nav_child_attr_selected}
                                            class="${nav_child_css_class}"
                                            id="layout_${nav_child.getLayoutId()}"
                                            role="presentation">
                                        <a aria-labelledby="layout_${nav_child.getLayoutId()}"
                                           href="${nav_child.getURL()}" ${nav_child.getTarget()}
                                           role="menuitem">${nav_child.getName()}</a>
                                    </li>
                                </#list>
                            </ul>
                        </#if>
                    </li>
                </#list>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li>
                    <#if !is_signed_in>
                        <a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in"
                           rel="nofollow">${sign_in_text}</a>
                    <#else>
                        <@liferay.user_personal_bar />
                    </#if>
                </li>
            </ul>
        </div>
    </div>
</div>
