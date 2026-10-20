declare module '@apiverve/countryflags' {
  export interface countryflagsOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface countryflagsResponse {
    status: string;
    error: string | null;
    data: CountryFlagsData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface CountryFlagsData {
      country:     null | string;
      countryCode: null | string;
      shape:       null | string;
      format:      null | string;
      downloadURL: null | string;
  }

  export default class countryflagsWrapper {
    constructor(options: countryflagsOptions);

    execute(callback: (error: any, data: countryflagsResponse | null) => void): Promise<countryflagsResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: countryflagsResponse | null) => void): Promise<countryflagsResponse>;
    execute(query?: Record<string, any>): Promise<countryflagsResponse>;
  }
}
