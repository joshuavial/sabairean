(function() {
  describe('chapter', function() {
    var chapter;

    chapter = new Chapter();
    return describe('list', function() {
      return it('includes "chapter"', function() {
        return expect(chapter.list()).toContain('chapter1');
      });
    });
  });

}).call(this);
