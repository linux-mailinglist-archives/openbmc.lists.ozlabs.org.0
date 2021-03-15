Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F09D33AD6C
	for <lists+openbmc@lfdr.de>; Mon, 15 Mar 2021 09:30:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzV4G0VmXz2yxn
	for <lists+openbmc@lfdr.de>; Mon, 15 Mar 2021 19:30:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=dL20ONgj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=70122f8a1=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=dL20ONgj; 
 dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir;
 Mon, 15 Mar 2021 19:30:37 AEDT
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DzV3x5DWvz2xdN
 for <openbmc@lists.ozlabs.org>; Mon, 15 Mar 2021 19:30:36 +1100 (AEDT)
IronPort-SDR: VWscZ4mCDGLf5WLBTyWv5m3WzJdqCBEr+rZi+007oJDq2bWNw50xk+LxXDuow8qrUaLamvB26k
 FTh4UAiWpXIw==
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx01.quantatw.com with ESMTP; 15 Mar 2021 16:29:29 +0800
Received: from mailbx06.quanta.corp (10.243.91.101) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 15 Mar
 2021 16:29:28 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (10.243.91.252)
 by mailbx06.quanta.corp (10.243.91.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 15 Mar 2021 16:29:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwjZQOxrFSrCpW9KDsXdnF2COnFullVWEcP87xQKSKbF/qp7YScwP1EfUnmJH6R7oRhXFrZ4IGoXFcBEqTXBsJ1ZTXdyK4tdhrFsNHEzwmEF5yYH4xLgqUC1Sa4XJQdgsIbHKgtayBRzk4jgIfWHaJSDOupuPwHCQTn0nDK6kb1rM0voMEt0x8TtqpLwJOzWeI+zLYtw2oggVFaXtZkfSgNrWoTu41Yb/76naf0wkoqXqWmvzyDlg1d1ErGIsP1DNahk8odw8Zk9QnLpulCnDsUa35KCJ+c6ENFxVMzIPT0zlenhSc924zLa3k6/7ki2CKGUBK3KL4/ZT6XgjBfEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQn/LtoLEjjMZNvRym3eCFG7jPOd25jWWOFWMO2dL1g=;
 b=a0KAIg+6cLWuN9sbbQIdLVHWqeuurJEHWe7sG7d1YnRbJfR+nWhcMTi7vIBwdm2e1DG3XXEoINaGYJAfULa8S9U+VDdq6rw00aMtAh7WFEkRvKP2FSCI6eTRm50AeFFPJWDdV9yTk228/DrW5hnG/YwRaw+D+7OBOKQGnLDxYYqwHrF64hHp6V7hgTwZcj4qxGnVOAT9hD9GOJvHeHwfx7G3/E2IIc5zPRs6llwzq9opUpnxuy8N2+RDd2qY54rmyUVcuX3wbFjKZMBTeQXVgfksy1Rem27hlFK7tyvZGv0E7IAKw9NZZFarzqqfDhHLs6fGqZx4YZmbz1YsWMh0Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQn/LtoLEjjMZNvRym3eCFG7jPOd25jWWOFWMO2dL1g=;
 b=dL20ONgjt8WwaHc5WcvTnyWiAJ40pOzcLDGuULkio7oh0+LDiWaaqUTxAD3av/nazIQQHw/oED2AxmXuGpAy8BBP/zf/xpvBpZ9r6MMmdb/Z3CjRNlpEig/hklGDkojF/UQzJV3F/dgIQlnHerijhkeZoRPTo3PlywLLJl4y4Ic=
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com (2603:1096:203:8f::22)
 by HK2PR0401MB2035.apcprd04.prod.outlook.com (2603:1096:202:6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 08:29:26 +0000
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::11f0:d474:d84a:d174]) by HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::11f0:d474:d84a:d174%5]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 08:29:26 +0000
From: =?big5?B?U3BlbmNlciBLdSAopWqlQLfsKQ==?= <Spencer.Ku@quantatw.com>
To: Nan Zhou <nanzhou@google.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Host Serial Console Logs via Redfish
Thread-Topic: Host Serial Console Logs via Redfish
Thread-Index: AQHXFGRmMf7l2V/JAkegO/w0o87HhqqEsciw
Date: Mon, 15 Mar 2021 08:29:26 +0000
Message-ID: <HK0PR04MB32993E0C43EBA2D2268642ABE46C9@HK0PR04MB3299.apcprd04.prod.outlook.com>
References: <CAOLfGj7xOoZw0HFvNNE5-fU0VNxt48CwSi_--y7JR01TWs-xqg@mail.gmail.com>
In-Reply-To: <CAOLfGj7xOoZw0HFvNNE5-fU0VNxt48CwSi_--y7JR01TWs-xqg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [220.135.135.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e469dd92-2540-4271-e571-08d8e78c71a9
x-ms-traffictypediagnostic: HK2PR0401MB2035:
x-microsoft-antispam-prvs: <HK2PR0401MB20350D2C626624882344F221E46C9@HK2PR0401MB2035.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WHbphrLmewshJMOGl5Mt7n/3shw2kfigblkqmQ5Vex2AVOLSB8af6SGnJ1TTY+mIy/bEF5WXQ5IqtsPh/3B79v6H8CyRsTN6ULJ49KRa8Nh21xtaf1pH9di1Sqor3Ft0NnaAecyUxmUC/q25DmbfLHaU8di2eeDm1IcM6aCEWNFZ8W+S0OjDYsyaGGOlrZP+DhHXfTD7oYR5IyyGMIibCh8sxsYpuJUeGq9G3zQY0nNkhbls/ouJLzXu2YQnER9WU4F2R1nE1gOPRTZpL/yDtqQGSijX6HlOEKuy24qZnNqcr1ceD1I8OsQ7AZF47aizoZQAm8cq+rWydyOGKblymqEO1HhOgs3hwxbqt5zU6nJ91Ja940OS2DdMLLQCWAUAlOzkd4gGiSzLVXjfRKgTRYxXY4DJ8zdUx9lRNRbzOB0kIzsFL6h3RbEtBP7L9MTtLMUJLRnedUHrZPVbBFQW8u3j36KU+GrbGQkn0I06gui+MmqhIqsbZq0wEjpgOpuPEI1YRSqZiRyBo7D2Pv8DyTna07IiZ3pPivtj8J8vEMWv3chbJwY5WwrYhMgLGRosNJIcTV27DWO0TQ2UWX3gCkPlNuTDYYrQJFHeeUFHW4LhfM1F8oICSGxV6N/dYH3IQGqARo77ggzpQ/L/jtxJWw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3299.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(966005)(66446008)(54906003)(8676002)(9686003)(7696005)(166002)(55016002)(85182001)(52536014)(5660300002)(8936002)(64756008)(26005)(66556008)(110136005)(66476007)(186003)(76116006)(86362001)(71200400001)(83380400001)(2906002)(45080400002)(33656002)(478600001)(316002)(4326008)(66946007)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?RW9lQUwzeGtzaGJLNnhYVHdDMlU4NmFQUUx1MEh4SDByaWI1MFBDTUZNbXpIMXZu?=
 =?big5?B?NlA5cEFIdnZ2L092M21kNnpkeXZ6dUF3Y3pMNVRaNTVVcUVmRkJHTm9kZHNJTmFS?=
 =?big5?B?MHdlSlZ1NmpRUnF2cnNrYWJGNEt3WTZseis3V2RpdGJ6TGZwUDZXMm5LMlg4NTVH?=
 =?big5?B?UWQ0QVhRaWgyYlR3SEIrK0pHMndkbXcrWkF5MHBYSVdUVDNNdDNUT2hHWDF2TkRV?=
 =?big5?B?Y0Npemo2N1NtMVdyZnByVC95akljdCtHZjRSLy95UWV3Qjg3c3VPWWlwWnlhY3F3?=
 =?big5?B?UENJeTVmR3EvaC8raDU5d1ErOVlEOUxXRTJHMThuMEZRZGxraXNQdm1aRVFJUk83?=
 =?big5?B?RWpydmREcktDTUhCdW5nY3lTK3NTQXpSbFpZZXFwclJORHhWamVuYzN6ZWU5enZx?=
 =?big5?B?U0liVlQ5SUlQcDZFWnlVM0xOZ0RXRDJ2VG9oWUkvN09SbG5UZXVkbUtLNWsrbmhW?=
 =?big5?B?ZS9ac0RURmM1cm9iK2E3N0wwYW9VK250anB6VVVIU3ZTb2VOK1grajd6RG5Ec3BI?=
 =?big5?B?Z3dDbUdlcnkrMWhjeENFTjdjZ3BreUhPaGZGZU1nR045Q2U1T3Z3anBkV2k2d2xx?=
 =?big5?B?OVBZaDd3cEc4R09kd1VuOGpSTS9IanR4aVRld0VTclU5M3pKd3llV3hBOHhzZUZm?=
 =?big5?B?dFFLeCtqNGpJejdYMTFPaUthQW5sUU9Qdi9mbGJCcGZuTFZheUJwRGVDV29tME1x?=
 =?big5?B?R1NZM0lnMmNnLzkyNysxM0F5UDZOUER2N00xZi8yeWlIK0ljYnJ3NWVPSFFSQkoz?=
 =?big5?B?aDZTYTJmblFJSjNGaSs4QTdYQStCZGhyZjVBT0Q2UGRRVmQzd2RwcXAweXdibUZQ?=
 =?big5?B?VWU4V2NKdEMxMmNiT1lwU2tSRzJ1VXRVaFppNHZFQWd1U0NTSVBGRXlyakxxUysz?=
 =?big5?B?R3NJazJKK21iRDNLalpWYWRROUFWOWdNUWJYR3ROME5ZMWpNUlVDcTVwczUyMTgr?=
 =?big5?B?M1BDdHZ1SmtKVDR2SHZqbElsK3FSMjFtRnFjSnRpMjZTWXYzNEtPOHd1ejFPYjRv?=
 =?big5?B?Ui9yTGxqTVA0VURNMk00djcrbTNVVU5CU1VDUlZVNGRoOGRiVGlBMTNzQ2pHUGRM?=
 =?big5?B?dVJFMWNJOUtRTzJZeUpzZC9vR053bjdKV1N2d1loNDQrYk1HUE0vMFFHLzJ5RDd2?=
 =?big5?B?UTVFM1dGWUZYVGg1VXpIbW5ETVlTWVFQZHRFOUh2TzNMZVFaRjJydW5Da0xZTnU4?=
 =?big5?B?WHh6UjQ3eDF1UWoxU0wzRkJvNDBWRXhCS0NxQ2lQSWxuNkNJOHF0d3NSWDhCVjIw?=
 =?big5?B?ZEFkRDNFTlphc3VqNTJwOE5IVTZwbzYxS0ZhbFo5RlpXVFYwVFZtQ1NhSEViN1hs?=
 =?big5?B?REJpcmxZeXRkK3NMZ2dJUWdQZWxIWkNXREU3NW8zWWZDT1o2Ri9PaFlSQWtoYW5v?=
 =?big5?B?dTVwOHZKS0JJL2VjQnpsL3VCSUFTR3dybkUwUVV6ejNrNmFpTnc4T1VBZlZjeWph?=
 =?big5?B?NjZEL3JkNUhON2x4VTVZMUpUaWJEUzNkOVdTTGNRQ3BNQVRHRTV4eDNadHZjcW8y?=
 =?big5?B?Z29iS3R5MGtBSmpUNXlla25pTFB3L3l2TjF6MFYrZXk5eVZMcmI2c0xGb1g4SFVK?=
 =?big5?B?cC9YV0tqQjNkNjQwbTRUZDNlakgvNkV5OWdiWm1jWXU5SlRIOThjMldRUXN0Qzh3?=
 =?big5?Q?qjdwt66CiDdnnoD/kLzBU1BX/17JT5yeT/scs8qJsfbwiDOM?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB32993E0C43EBA2D2268642ABE46C9HK0PR04MB3299apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3299.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e469dd92-2540-4271-e571-08d8e78c71a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 08:29:26.0343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3zmA0NCY+bZO0v0Nu4CqA/D/1CUVaJxE4CbxqU7sq7vTZnG0DN26V9Ndpr7CEBufqLqa1ws14GgHGqN8AJocUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0401MB2035
X-OriginatorOrg: quantatw.com
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Justin Chen <juschen@google.com>,
 Litzung Chen <litzung.chen@quanta.corp-partner.google.com>,
 Ofer Yehielli <ofery@google.com>, Ed Tanous <edtanous@google.com>,
 Richard Hanley <rhanley@google.com>,
 Spencer Ku <spencer.ku@quanta.corp-partner.google.com>,
 Zhenfei Tai <ztai@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB32993E0C43EBA2D2268642ABE46C9HK0PR04MB3299apcp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgTmFuLA0KDQpUaGFuayB5b3UgZm9yIHRoZSBhbm5vdW5jZW1lbnQsIGFuZCBoZXJlIGlzIGEg
bGl0dGxlIGZlZWRiYWNrIGZvciB0aGUgaW50cm9kdWN0aW9uLg0KDQpIb3BlIGl0IHdpbGwgYmUg
aGVscGZ1bCB0byB5b3UuDQoNCg0KDQpPbiBNb24sIE1hciAwOCwgMjAyMSBhdCAwMTo0NTowMFBN
IC0wODAwLCBOYW4gWmhvdSB3cm90ZToNCg0KDQoNCj4gICBXZSBmb3VuZCB0aGVyZSBhcmUgc29t
ZSBpbXByb3ZlbWVudHMgYXMgbGlzdGVkIGJlbG93LA0KDQo+ICAgLSBMb2dzIGFyZSBub3QgZXhw
b3NlZCB0byBSZWRmaXNoIHVudGlsIHRoZXkgcmVhY2ggQlVGX01BWFNJWkUgb3IgQlVGX01BWFRJ
TUUNCg0KPiAgIChkZWZpbmVkIGluIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9y
LWhvc3Rsb2dnZXIpLCBidXQgd2Ugd2FudA0KDQo+ICAgdG8gYWNoaWV2ZSBhIHN0cmVhbS1saWtl
IGNvbnNvbGUuIFdlIGNvdWxkIHNldCBCVUZfTUFYU0laRSB0byAxIG9yIEJVRl9NQVhUSU1FDQoN
Cj4gICB0byBhIHZlcnkgc2hvcnQgaW50ZXJ2YWwsIGJ1dCBpdCB3aWxsIGFtcGxpZnkgdGhlIG92
ZXJoZWFkIG9mIGNvbXByZXNzaW9uIGFuZA0KDQo+ICAgZGVjb21wcmVzc2lvbi4NCg0KDQoNCkp1
c3QgcmVtaW5kIHRoYXQgaG9zdGxvZ2dlciBtZXNzYWdlIGNhbiBtYW51YWwgZmx1c2ggYnkgdHJp
Z2dlciBzaWduYWwgU0lHVVNSMS4NCg0KDQoNCj4gICAtIFBlcnNpc3RlbmNlIGlzbqGmdCBvcHRp
b25hbC4gcGhvc3Bob3ItaG9zdGxvZ2dlciBkb2VzbqGmdCBleHBvc2UgYW55IElQQyBpbnRlcmZh
Y2UuDQoNCj4gICBibWN3ZWIgY2FuIG9ubHkgdGFsayB0byBwaG9zcGhvci1ob3N0bG9nZ2VyIHZp
YSB6aXAgZmlsZXMsIHdoaWNoIG1ha2VzIHBlcnNpc3RlbmNlIG9mIGxvZ3MgYSBuZWNlc3Nhcnkg
Y29uZGl0aW9uLg0KDQo+DQoNCj4gICAtIE1ldGhvZCAxOiAqRC1CdXMgU2lnbmFsKjsgcGhvc3Bo
b3ItaG9zdGxvZ2dlciBpbXBsZW1lbnRzIGFuIGludGVyZmFjZQ0KDQo+ICAgd2hpY2ggY29udGFp
bnMgYSBzaWduYWwuIFRoZSBwYXlsb2FkIG9mIHRoZSBzaWduYWwgc2hvdWxkIGNvbnRhaW4NCg0K
PiAgIHRpbWVzdGFtcHMgYW5kIGxvZyBtZXNzYWdlcy4gIEJtY1dlYiByZWdpc3RlcnMgYXMgYSBs
aXN0ZW5lciBhbmQgb25jZSBpdA0KDQo+ICAgcmVjZWl2ZXMgYSBzaWduYWwsIGl0IHBvcHVsYXRl
cyBhIG5ldyBMb2dFbnRyeS4gQm1jV2ViIHNob3VsZCBpbXBsZW1lbnQgaXRzDQoNCj4gICBvd24g
Y29uZmlndXJhYmxlIHJpbmcgYnVmZmVyIHRvIHN0b3JlIGxvZyBlbnRyaWVzIHJlY2VpdmVkIGZy
b20gRC1CdXMuDQoNCg0KDQpJIHRoaW5rIHRoaXMgbWV0aG9kIGNhbiBiZSBjb3ZlcmVkIGJ5IHBo
b3NwaG9yLWhvc3Rsb2dnZXIgaWYgd2UgdXNpbmcgU0lHVVNSMSB0byB0cmlnZ2VyIHRoZSBtZXNz
YWdlLg0KDQpCdXQgdGhlIHBlcmZvcm1hbmNlIHdpbGwgYmUgYSBwcm9ibGVtLg0KDQoNCg0KPiAg
IC0gTWV0aG9kIDI6ICpGaWxlIFdhdGNoZXIqOyBhZGQgZmlsZSB3YXRjaGVycyBpbiBCbWNXZWIg
dG8gbW9uaXRvciB0aGUNCg0KPiAgIGxvZyBmaWxlcyBwcm9kdWNlZCBieSBwaG9zcGhvci1ob3N0
bG9nZ2VyLiBUaGlzIG1ldGhvZCBpcyBzaW1pbGFyIHRvIG1ldGhvZA0KDQo+ICAgMS4gQnV0IHBl
cnNpc3RlbmNlIGlzIHN0aWxsIGEgbmVjZXNzYXJ5IGNvbmRpdGlvbi4NCg0KPiAgIC0gTWV0aG9k
IDM6ICpvYm1jLWNvbnNvbGUgKyBibWN3ZWIqOiBpbnN0YWxsIHRoZSBjb25zb2xlIGNvbGxlY3Rp
b24gYW5kDQoNCj4gICByaW5nIGJ1ZmZlciBwYXJ0cyBvZiBwaG9zcGhvci1ob3N0bG9nZ2VyIGFz
IGEgbGlicmFyeS4gVXNlIHRoZSBsaWJyYXJ5DQoNCj4gICBkaXJlY3RseSBpbiBCbWNXZWIgdG8g
Y29sbGVjdCBjb25zb2xlIGxvZ3MuDQoNCg0KDQpJIHByZWZlciB0byB0aGlzIG1ldGhvZCwgYnV0
IGhvdyB0byBpbXBsZW1lbnQgdGhlIHBob3NwaG9yLWhvc3Rsb2dnZXIgYXMgYSBsaWJyYXJ5IGFu
ZCBpbnN0YWxsIGludG8gdGhlIGV4aXN0aW5nIGJtY3dlYiBtYXkgYmUgYSBwcm9ibGVtLg0KDQoN
Cg0KPiAgIC0gTWV0aG9kIDQ6ICpwaG9zcGhvci1ob3N0bG9nZ2VyICsgam91cm5hbCArIHJzeXNs
b2cgKyBibWN3ZWIqOiB0aGlzDQoNCj4gICBhcmNoaXRlY3R1cmUgaXMgdmVyeSBzaW1pbGFyIHRv
IHdoYXQgdGhlIGN1cnJlbnQgT3BlbkJNQyB1c2VzIGZvcg0KDQo+ICAgcmVkZmlzaC1ldmVudA0K
DQo+ICAgPGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3Vy
bD1odHRwcyUzQSUyRiUyRmdpdGh1Yi5jb20lMkZvcGVuYm1jJTJGZG9jcyUyRmJsb2IlMkZtYXN0
ZXIlMkZhcmNoaXRlY3R1cmUlMkZyZWRmaXNoLWxvZ2dpbmctaW4tYm1jd2ViLm1kJmFtcDtkYXRh
PTA0JTdDMDElN0NTcGVuY2VyLkt1JTQwcXVhbnRhdHcuY29tJTdDYjljZGFhYTQ4ZDFkNGQyMDc3
MTIwOGQ4ZTMwN2UwYTUlN0MxNzliMDMyNzA3ZmM0OTczYWM3MzhkZTczMTM1NjFiMiU3QzElN0Mw
JTdDNjM3NTA4OTcwMjcxODYxMDQ1JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0
d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3
QzEwMDAmYW1wO3NkYXRhPTdSd0c4dGpzRlQ1TkhUNktoZHhSY1BpNmpOSnFpN0xMVjNRdWFlb01w
ZDglM0QmYW1wO3Jlc2VydmVkPTA+Lg0KDQo+ICAgQWRkIGEgbmV3IHNjaGVtYSBmb3IgbG9nIGVu
dHJpZXMuIFB1Ymxpc2ggam91cm5hbCBsb2dzIGluDQoNCj4gICBwaG9zcGhvci1ob3N0bG9nZ2Vy
LiBBZGQgZmlsZSB3YXRjaGVycyBpbiBCbWNXZWIgdG8gbW9uaXRvciB0aGUgbG9nIGZpbGVzDQoN
Cj4gICBwcm9kdWNlZCBieSByc3lzbG9nLiByc3lzbG9nIHNob3VsZCBoYXZlIGxvZyByb3RhdGlv
biBlbmFibGVkLiBQZXJzaXN0ZW5jZQ0KDQo+ICAgaXMgc3RpbGwgYSBuZWNlc3NhcnkgY29uZGl0
aW9uLg0KDQoNCg0KU2luY2VyZWx5LA0KDQpTcGVuY2VyIEt1DQoNCg==

--_000_HK0PR04MB32993E0C43EBA2D2268642ABE46C9HK0PR04MB3299apcp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:=B7s=B2=D3=A9=FA=C5=E9;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=B7s=B2=D3=A9=FA=C5=E9";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"=AF=C2=A4=E5=A6r =A6r=A4=B8";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
span.a
	{mso-style-name:"=AF=C2=A4=E5=A6r =A6r=A4=B8";
	mso-style-priority:99;
	mso-style-link:=AF=C2=A4=E5=A6r;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1269695875;
	mso-list-template-ids:985435012;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:=84h;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:=84X;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:=84X;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:=84X;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:=84X;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:=84X;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:=84X;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:=84X;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1
	{mso-list-id:1293251441;
	mso-list-template-ids:-207869536;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:=84h;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:=84X;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:=84X;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:=84X;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:=84X;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:=84X;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:=84X;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:=84X;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2
	{mso-list-id:2053722701;
	mso-list-type:hybrid;
	mso-list-template-ids:458155410 -488465268 67698691 67698693 67698689 6769=
8691 67698693 67698689 67698691 67698693;}
@list l2:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:=84=AB;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;
	font-family:Wingdings;
	mso-fareast-font-family:=B7s=B2=D3=A9=FA=C5=E9;
	mso-bidi-font-family:"Courier New";}
@list l2:level2
	{mso-level-number-format:bullet;
	mso-level-text:=83=DE;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:48.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l2:level3
	{mso-level-number-format:bullet;
	mso-level-text:=83=E5;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:72.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l2:level4
	{mso-level-number-format:bullet;
	mso-level-text:=83=DC;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:96.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l2:level5
	{mso-level-number-format:bullet;
	mso-level-text:=83=DE;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:120.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l2:level6
	{mso-level-number-format:bullet;
	mso-level-text:=83=E5;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:144.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l2:level7
	{mso-level-number-format:bullet;
	mso-level-text:=83=DC;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l2:level8
	{mso-level-number-format:bullet;
	mso-level-text:=83=DE;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:192.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
@list l2:level9
	{mso-level-number-format:bullet;
	mso-level-text:=83=E5;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:216.0pt;
	text-indent:-24.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<div>
<div>
<div>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Hi Nan,<o:p></o:p></span></p=
>
<p class=3D"MsoPlainText" style=3D"text-indent:12.0pt"><span lang=3D"EN-US"=
>Thank you for the announcement, and here is a little feedback for the intr=
oduction.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Hope it will be helpful to y=
ou.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">On Mon, Mar 08, 2021 at 01:4=
5:00PM -0800, Nan Zhou wrote:<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; We found th=
ere are some improvements as listed below,<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; - Logs are =
not exposed to Redfish until they reach BUF_MAXSIZE or BUF_MAXTIME
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; (defined in=
 https://github.com/openbmc/phosphor-hostlogger), but we want
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; to achieve =
a stream-like console. We could set BUF_MAXSIZE to 1 or BUF_MAXTIME<o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; to a very s=
hort interval, but it will amplify the overhead of compression and
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; decompressi=
on.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Just remind that hostlogger =
message can manual flush by trigger signal SIGUSR1.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; - Persisten=
ce isn</span><span lang=3D"EN-US" style=3D"font-family:&quot;Courier New&qu=
ot;">=A1=A6</span><span lang=3D"EN-US">t optional. phosphor-hostlogger does=
n</span><span lang=3D"EN-US" style=3D"font-family:&quot;Courier New&quot;">=
=A1=A6</span><span lang=3D"EN-US">t
 expose any IPC interface. <o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; bmcweb can =
only talk to phosphor-hostlogger via zip files, which makes persistence of =
logs a necessary condition.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;<o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; - Method 1:=
 *D-Bus Signal*; phosphor-hostlogger implements an interface<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; which conta=
ins a signal. The payload of the signal should contain<o:p></o:p></span></p=
>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; timestamps =
and log messages.&nbsp; BmcWeb registers as a listener and once it<o:p></o:=
p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; receives a =
signal, it populates a new LogEntry. BmcWeb should implement its<o:p></o:p>=
</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; own configu=
rable ring buffer to store log entries received from D-Bus.<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">I think this method can be c=
overed by phosphor-hostlogger if we using SIGUSR1 to trigger the message.<o=
:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">But the performance will be =
a problem.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; - Method 2:=
 *File Watcher*; add file watchers in BmcWeb to monitor the<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; log files p=
roduced by phosphor-hostlogger. This method is similar to method<o:p></o:p>=
</span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; 1. But pers=
istence is still a necessary condition.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; - Method 3:=
 *obmc-console + bmcweb*: install the console collection and<o:p></o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; ring buffer=
 parts of phosphor-hostlogger as a library. Use the library<o:p></o:p></spa=
n></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; directly in=
 BmcWeb to collect console logs.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">I prefer to this method, but=
 how to implement the phosphor-hostlogger as a library and install into the=
 existing bmcweb may be a problem.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; - Method 4:=
 *phosphor-hostlogger + journal + rsyslog + bmcweb*: this<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; architectur=
e is very similar to what the current OpenBMC uses for<o:p></o:p></span></p=
>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; redfish-eve=
nt<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; &lt;<a href=
=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2Fopenbmc%2Fdocs%2Fblob%2Fmaster%2Farchitecture%2Fredfish-logging-i=
n-bmcweb.md&amp;amp;data=3D04%7C01%7CSpencer.Ku%40quantatw.com%7Cb9cdaaa48d=
1d4d20771208d8e307e0a5%7C179b032707fc4973ac738de7313561b2%7C1%7C0%7C6375089=
70271861045%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D7RwG8tjsFT5NHT6KhdxRcPi6=
jNJqi7LLV3QuaeoMpd8%3D&amp;amp;reserved=3D0">https://apc01.safelinks.protec=
tion.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fdocs%2Fblob%2F=
master%2Farchitecture%2Fredfish-logging-in-bmcweb.md&amp;amp;data=3D04%7C01=
%7CSpencer.Ku%40quantatw.com%7Cb9cdaaa48d1d4d20771208d8e307e0a5%7C179b03270=
7fc4973ac738de7313561b2%7C1%7C0%7C637508970271861045%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000=
&amp;amp;sdata=3D7RwG8tjsFT5NHT6KhdxRcPi6jNJqi7LLV3QuaeoMpd8%3D&amp;amp;res=
erved=3D0</a>&gt;.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; Add a new s=
chema for log entries. Publish journal logs in<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; phosphor-ho=
stlogger. Add file watchers in BmcWeb to monitor the log files<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; produced by=
 rsyslog. rsyslog should have log rotation enabled. Persistence<o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">&gt;&nbsp;&nbsp; is still a =
necessary condition.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Sincerely,<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Spencer Ku<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Cali=
bri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_HK0PR04MB32993E0C43EBA2D2268642ABE46C9HK0PR04MB3299apcp_--
