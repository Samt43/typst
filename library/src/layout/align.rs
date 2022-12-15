use crate::prelude::*;

/// Align content horizontally and vertically.
///
/// Tags: layout.
#[func]
#[capable]
#[derive(Debug, Hash)]
pub enum AlignNode {}

#[node]
impl AlignNode {
    /// The alignment.
    #[property(fold, skip)]
    pub const ALIGNS: Axes<Option<GenAlign>> =
        Axes::new(GenAlign::Start, GenAlign::Specific(Align::Top));

    fn construct(_: &Vm, args: &mut Args) -> SourceResult<Content> {
        args.expect("body")
    }

    fn set(...) {
        let aligns: Axes<Option<GenAlign>> = args.find()?.unwrap_or_default();
        styles.set(Self::ALIGNS, aligns);
    }
}
