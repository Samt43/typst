use crate::library::prelude::*;

/// A node that should be repeated to fill up a line.
#[derive(Debug, Hash)]
pub struct RepeatNode(pub LayoutNode);

#[node]
impl RepeatNode {
    fn construct(_: &mut Machine, args: &mut Args) -> TypResult<Content> {
        Ok(Content::inline(Self(args.expect("body")?)))
    }
}

impl Layout for RepeatNode {
    fn layout(
        &self,
        ctx: &mut Context,
        regions: &Regions,
        styles: StyleChain,
    ) -> TypResult<Vec<Frame>> {
        // The actual repeating happens directly in the paragraph.
        self.0.layout(ctx, regions, styles)
    }
}