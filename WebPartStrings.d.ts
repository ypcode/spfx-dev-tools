declare interface IWebPartStrings {
    SchemaPropertyButtonLabel: string;
    SchemaPropertyEditorCancelButtonLabel: string;
    SettingsGroupName: string;
    PropertyPaneDescription: string;
    SchemaPropertyEditorResetButtonLabel: string;
    SchemaPropertyEditorOkButtonLabel: string;
}

declare module 'WebPartStrings' {
    const strings: IWebPartStrings;
    export = strings;
}
