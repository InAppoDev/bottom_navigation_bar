void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            color: ColorConstants.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(12, 0, 0, 0),
                blurRadius: 10,
                offset: Offset(0, -6), // changes position of shadow
              )
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0)
            )
          ),
          child: TabBar(
            controller: _controller,
            unselectedLabelColor: ColorConstants.textColor,
            indicatorColor: _currentIndex==3?Colors.red:ColorConstants.blueBackground,
            labelColor: _currentIndex==3?Colors.red:ColorConstants.blueBackground,
            labelPadding: EdgeInsets.symmetric(horizontal: 0.0),
            onTap: onTabTapped,
            tabs: [
              Tab(
                  icon: Icon(AdvisorIcons.movie),child:navBarTab("Фильмы", 0, _currentIndex)),
              Tab(icon: Icon(Icons.search), child:navBarTab("Поиск", 1, _currentIndex)),
              Tab(
                  icon: Icon(AdvisorIcons.saved),
                  child:navBarTab("Сохранённое", 2, _currentIndex),),
              Tab(
                icon: Icon(
                  Icons.local_fire_department,
                  color: Colors.red,
                ),
                child: navBarTab("Топ", 3, _currentIndex,isTop: true),
              )
            ],
          ),
        ),
        body:TabBarView(
          controller: _controller,
        children:
        [
          GenresPage(widget.type),
          SearchPage(),
          FavoritesPage(),
          TopPage()
            ]
        ));
  }
