enum TypeEntityName { researchRetreat, scientificMaterial, mix }

extension TypeNameHelpers on TypeEntityName {
  bool get shouldEnterCallNumber =>
      this == TypeEntityName.scientificMaterial || this == TypeEntityName.mix;

  bool get shouldPickFromAviliableRange =>
      this == TypeEntityName.researchRetreat || this == TypeEntityName.mix;

  bool get shouldPickHall =>
      this == TypeEntityName.researchRetreat || this == TypeEntityName.mix;
}
