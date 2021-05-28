Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8188393F14
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 10:59:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrzBf6LrYz302L
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 18:59:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=K7AGi3e4;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=K7AGi3e4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.119; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=K7AGi3e4; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=K7AGi3e4; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310119.outbound.protection.outlook.com [40.107.131.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzBG5z9Pz2xv6
 for <openbmc@lists.ozlabs.org>; Fri, 28 May 2021 18:58:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0MXjsnPgyV7ci2X3w+a/sR/SvFj4fywBhoW/G3P0ro=;
 b=K7AGi3e4jOMAOd/fCNX2rJZ/WLfJIjVHh7YWQp+ZJy1STKyubPtlf2GpSrSuDAocwD6FpClySXaTKZ3OHkE6rF6G3lIUAODIr4hN4w2BTEg4wgvBaC0QQ9i5KlkLOztxPObHcqPDYrwjEfPhjV51DTyNLoGterCkk5BuJUIxGbpm7QmzgGOTXj3jNPqqIOL8Fq8+a6rt06HWMTRYzADhZZr/1KbTiv6UgpdLhdBDuePK+aSfIK6tQ33XY3cLWkCkL+lE1Rt+qOAbeBh0B2M2cO19aMQ3v/jj78fECEl+45vOkfg2Nxf/vuudfNoydbNgnYYa0SoOPgMUj0ZL+USSLg==
Received: from SG2PR03CA0108.apcprd03.prod.outlook.com (2603:1096:4:7c::36) by
 TY2PR04MB3471.apcprd04.prod.outlook.com (2603:1096:404:9b::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.21; Fri, 28 May 2021 08:58:39 +0000
Received: from SG2APC01FT030.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:7c:cafe::4d) by SG2PR03CA0108.outlook.office365.com
 (2603:1096:4:7c::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.12 via Frontend
 Transport; Fri, 28 May 2021 08:58:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.59)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.59; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.59) by
 SG2APC01FT030.mail.protection.outlook.com (10.152.250.200) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.28 via Frontend Transport; Fri, 28 May 2021 08:58:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRMvMmEoE0n4kVzwcel1dHnsybvlfALRmVoX/hqhwNYjsv8Z0T39s0A0GlKLxkIgy5J/uakId24oV5qybR3LkOTiY1+EGtFn72zOHh+D0ZXJVFYmjREajRnsbDU1MGHvykBdE5OUYvipvz+Ixk+MN2yo7IgOyF7qClsn19FR4PUjAidd2X34IkVVAVfoaQMhu7GmyQGtjGbQOQO6zuW/WEeJ7LVKoAaS7Sqt5chBREwnW89OV/Wt9YzB/6hBf4jQFcUoEbMznD8Smau7V1DvjvYB6ce4uoWAle0s9YyJ5JzB3GNIx4bZ5YtGCe2G9ps+QP2WFc7OtNZLgIiHMqkQQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0MXjsnPgyV7ci2X3w+a/sR/SvFj4fywBhoW/G3P0ro=;
 b=I+TnIMkkDDhOdgM9KBKB7Sn/zCWb/qD727hh/19Bx+qc58YTTfGeV9/EA1NHBJAf41T0JM9kozWPWnQ9NRFE4Zicrayt3YvL42CWzVFBceAEwa4rp7RffK6z6fO/04aq6uBcIFxL+6mlVmqnMBFTpkhhJmpVliC6TjdwI1yF1nPb9wy+stlCRPf/StsMErYI92XB3+Bp+Z6J8o57+eJoX90wFq67rkRW0Ldc6D5h42R7YkFlR05H2xVci/tzNYGp9qCOA+zA4iRF6NK7jcSnQ5U/h8T6kUQ8lqU1wlQTxqRzVAgecpjWf8C+S18ZwFylVbyN2wH+4jWyLcOrUSNJnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0MXjsnPgyV7ci2X3w+a/sR/SvFj4fywBhoW/G3P0ro=;
 b=K7AGi3e4jOMAOd/fCNX2rJZ/WLfJIjVHh7YWQp+ZJy1STKyubPtlf2GpSrSuDAocwD6FpClySXaTKZ3OHkE6rF6G3lIUAODIr4hN4w2BTEg4wgvBaC0QQ9i5KlkLOztxPObHcqPDYrwjEfPhjV51DTyNLoGterCkk5BuJUIxGbpm7QmzgGOTXj3jNPqqIOL8Fq8+a6rt06HWMTRYzADhZZr/1KbTiv6UgpdLhdBDuePK+aSfIK6tQ33XY3cLWkCkL+lE1Rt+qOAbeBh0B2M2cO19aMQ3v/jj78fECEl+45vOkfg2Nxf/vuudfNoydbNgnYYa0SoOPgMUj0ZL+USSLg==
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.22; Fri, 28 May 2021 08:58:33 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::d0a9:a582:66d3:29c3]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::d0a9:a582:66d3:29c3%3]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 08:58:33 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: SEL Event logs in Redfish
Thread-Topic: SEL Event logs in Redfish
Thread-Index: AddTnPob+JlCOd4oTdCNqZ5XZnEp3w==
Date: Fri, 28 May 2021 08:58:33 +0000
Message-ID: <SG2PR04MB30931F4EAC5DC1D4E968631EE1229@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiOTU0ZTQwYzMtM2E4My00MmZhLWJmZWMtYWNiNjA3ODU3MDQ1IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IjdqWkcyM3VrOVdTdk5lUlJxNVpyUFwvNFJ4Y2lBRWdmMWNkdk9XRmJMYU9FMklNOExCYTIwNDhvT1RzdFhYbk9QIn0=
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [157.49.70.231]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7de3f343-b7bb-4bb1-de41-08d921b6c813
x-ms-traffictypediagnostic: SG2PR04MB3093:|TY2PR04MB3471:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <TY2PR04MB3471EE26447F076039F4A766E1229@TY2PR04MB3471.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Elu5KtYF1HDxSkeTNlJ9x1imOYFnfO12tJ0RhCYlwpEFPQQddPSa1O+Q0yxaKPPh2xLT0J9xb+ZkJ3ZkTeNjNd0upigbhVgYvc0iI6hyhHU0rY1ZRaIACzMWABxMUB1trr0kk3/hqcMEM2MajDHjXeqFFIvU1o/tqBeJGOvTRR34wOTh31dDgzGVgFHAxyE0t4nY2kMO0HM+h3/2ETbX6Hn/InJuy4ipBHA55mDq5F+dxXlrAmqfukhl+qXr0B0svyA5VtfNjBK5trEHYPGhORpY9mwFDnohN2uCu07hXOio4VbP8S0Bbqb/XskwahjC2ho/bZTdokNCD7r0gvWGmrbA281T8kLe4gC10IsElUvxs1qKKyPIKCQUqBwkLdYHRiFVzVkSWn9HI7p/nc4xrC1/q7LTVj8bSsgEEMR5GnKBhKpjapqOij5wz3hRO/kpWXF4uhfJfJV0VXm9DDee++qaI0XlkX9JdkVh8WyuuthHsyYZWe4gYwFGSoFUdFIwdiw0RSLGmvs2/HEOFkT9pO9jVFvqH/Gai6++n6Eoe6ySzMlgmMTTT3a2UJYOUBsIXAddmzOKswslBqhKMPU+tDnyxbRM/KxAOn1q18kevbf8DKGSDHFRxhNMmxRO5mo0mmwBPqRtwOldESvad4n8oCUq4+fW43ZZbrhMLY7gPQTAX7vvoeDDaNy2ZeIz/9OUUyBkqShnkVAM+Ymts7kGCQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(45080400002)(76116006)(66946007)(54906003)(316002)(66446008)(64756008)(66556008)(71200400001)(66476007)(966005)(186003)(4326008)(478600001)(2906002)(53546011)(6916009)(9686003)(8936002)(55016002)(26005)(122000001)(5660300002)(52536014)(7696005)(33656002)(83380400001)(86362001)(6506007)(38100700002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?emyZ/viuubmNFShJ8UhDvrsSODwSEvKrD/wX1LqduTgg+DZS0ysa4mfLoOcD?=
 =?us-ascii?Q?2JdhaT07jwar27LALmakRcM+1bHwS1AHX6J1gPgrX6Dpnm87XZx0GbQRNRpc?=
 =?us-ascii?Q?HtP9Ok++BC+FxkCndgSn+9EQBw4wLcWv7KvwhNrcQCbonWWmK9C+lXMacVaC?=
 =?us-ascii?Q?YNeLFxqMjkKrw52WaF4yDXKsrL/P5mBceExIZDuIMHOT0uy9kjonoJfuKlLo?=
 =?us-ascii?Q?mqATAIcNHRvUjcNsQFAXYnjRg3v8+5yKbUvz0L7u2JicjUxbHDfO1qzZoa2i?=
 =?us-ascii?Q?BjLvRCb2vC8aZHI+Jr1WWfXuEbiiD7TfFxxRD4xuweucOFOmzeMmXTSmPsMG?=
 =?us-ascii?Q?mMAIa0soow7qm88qChKdXGb9tVzsxorllw6+WmHb1o/arE6lREU7XsJGJoiI?=
 =?us-ascii?Q?c+PF27n5+Uyci5cQHw8MdNKqi42CeIbK1PKqCrqylwx/ShM9/K7gUlO2xFf1?=
 =?us-ascii?Q?N7XiudbS9ychMny3DMYG55cFrwHQw1JG2OfhJz0YV+VfHrgr9LVkhG4wL/2w?=
 =?us-ascii?Q?2MhVUrHjWEPe89WjGy50y1qpgjnP8D4MAmmwdEca5RJztobS/rjcmagIjw0W?=
 =?us-ascii?Q?uJSyziYanLaiMXlU90bKBHY1/BqJ4TpvN3OgksGFh2vrh1Asz8nmYo2bOyNw?=
 =?us-ascii?Q?1B9TG7e3cxNU59N+zbMs4bJG1HNMQ3u2UHSOJfzARkyS/jawXi7oHAZGtkDd?=
 =?us-ascii?Q?9r1ROIUIrpB4f7nhsC7qbkNkKm/xN1WtmtZXDSAZLOEsehsmg3x9Yb5qrFOQ?=
 =?us-ascii?Q?dCQNlggSq9u0OEGE3nj6w2mLA//Il1a/eICPe6MiyLVXsLnvGqatE7pIey4s?=
 =?us-ascii?Q?2QEm98PeCA54Qi/DiKB9S7yUFVrFxImG7Fe7kJs0UbkOsq3/2rXS+bjazSuG?=
 =?us-ascii?Q?/yFIvICVNG1QsuMoiGfjXlLbWVDWLXTeV8WZmMlZwA4MbIz+x4yFBL5VO3Fg?=
 =?us-ascii?Q?ibBBoRRPcU9NhcsCovl69D5f8kBuLuSvt2eDizUQNgXazm+9o/Yewg6lt9pn?=
 =?us-ascii?Q?gB7kJ0gv9ZuJYAegDpuLrCYvYv+5AkC4NoC9bPMPBEUOQTTGHC9DmrODvof2?=
 =?us-ascii?Q?S+kofxQNu3kPhdxGYU+Ts5xsnTfW/T/RK0yw+46j+P0xxGNIwBjI2CSz5yCA?=
 =?us-ascii?Q?lT6wS0qbNJoB7i5/IFl/ieyEaOFWX2K0YPnw26Wa4OwP579VfC7jq36QGcAp?=
 =?us-ascii?Q?Y1H0aJ5dtiODKi6eSNTUpznIafiQ/QSONm5pmQQpmJdRxGYMF867kYpPDMG0?=
 =?us-ascii?Q?zv5tEDARozleWTXAxzlD2qEgk9pC+Uvvh/CuQ7GwEFf55UUQmfCvl79KtxB9?=
 =?us-ascii?Q?EuU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3093
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT030.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 565e7e47-c70d-4bb6-7eba-08d921b6c5f3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p1KIW7VfubRl+jW563B9+IfwLql2GHixiv2qJifFWQE2VHca0YhDz3vrzEKm0PgFJu3j9l6FFsRVsx4VM5KzZGd7Zj+uybGYMjwSf1ClGpWS97+jMv199lmgAsQhM0mt/0QuzZhvHrw7CRZy3fyO4zftDHh9XdwnRrm7KJ9/VJT1Yoc05ef7FtwFQP+L7VEHuMiV1+FbKgc9dFdm2zg8o/7KJabdbj/nT8fuS2CxJyxHI+YTz5h3dN4+sv4yYAbqkcA4XR804a6YPNMFfGMlWjNE0/EgnMKC88P2NiyrgjeBShcI05nfB9NpwqZgdIlIT6n8n2eoTZVMpb5J7r1aUQcdOYWcFfefw08DKuqjeKFOTqAE42rV+ss6QedAYXlYc8rE/QWHg4u1akFD6fjW/U/0YhgPyYUSBr5OqzXLihhtVg7TBYd2tlv0TJ4eps3Io9q4xz0cKGK5CYANV/xO9kfyOm+k0pM4LRl1kBQznw++80uHgMuXN3KWQ0SidxR+gO6F7rwi5vuZuV17RI/fIplp6NzBEBDFOtPfZBiKcsWm0CP6EiGR+16vq4xk0IUEwEAqdC999iPrHbn8zid4ilB+/m1adD4ZGgJ8XlcoD9CCHCwOyO02rgbLeG2cGic++5cgUWNo5mAx1NSWT7W5BRL19IxFMPrUCLiDzHEIe8cI9SPXc3PhAS/fHlZIJF3jcm7i/ZreHNjkYwvEadzrrecwZhbh0lQZqU+AKOvtWuFYsfn0v9Cv+vF/qOQmBJ3LUdq2b1JoczBqUxw/ZwsHc9zcwB9Rt2w6T5grN/V+0Re1RwFS7XZfueijFlEFMZblqRatomxJhPRBFBiw5nRJgQ==
X-Forefront-Antispam-Report: CIP:192.8.195.59; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(36840700001)(46966006)(45080400002)(55016002)(186003)(6506007)(36860700001)(478600001)(7696005)(47076005)(8936002)(86362001)(53546011)(52536014)(5660300002)(82740400003)(8676002)(81166007)(356005)(83380400001)(6916009)(70586007)(36906005)(9686003)(966005)(2906002)(54906003)(26005)(316002)(82310400003)(34020700004)(336012)(4326008)(70206006)(33656002)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 08:58:36.4446 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de3f343-b7bb-4bb1-de41-08d921b6c813
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.59];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT030.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3471
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
Cc: "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>, "Velumani
 T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Classification: Public

Hi Jason,

In journalctl log, I found that the sensor value is crossed the threshold v=
alue.
But when I tried in Redfish API, I am not able to see any logs, whether any=
thing I am missing here ?
Could you please provide suggestions on this .

root@tiogapass:~# journalctl | grep adc
Jan 01 00:13:46 tiogapass adcsensor[298]: Sensor _MB_P5V low threshold 4.52=
 assert: value 4.51 raw data 1337

curl -k -H "X-Auth-Token: $token" -X GET https://${bmc}/redfish/v1/Systems/=
system/LogServices/EventLog/Entries
{
  "@odata.id": "/redfish/v1/Systems/system/LogServices/EventLog/Entries",
  "@odata.type": "#LogEntryCollection.LogEntryCollection",
  "Description": "Collection of System Event Log Entries",
  "Members": [],
  "Members@odata.count": 0,
  "Name": "System Event Log Entries"
}

Thanks,
Jayashree

On 5/24/2021 8:15 AM, Bruce Mitchell wrote:
> On 5/24/2021 06:41, Jayashree D wrote:
>>=20
>> Hi Team,
>>
>> I need some clarification on SEL Logs.
>> In SEL Event logs, when the error is injected manually , I can able=20
>> to see the error logs in "ipmitool sel list" command.
>> Whether it will also reflect in Redfish API ?
I am mostly familiar with the journal-bases SEL logging.  In that case, pho=
sphor-sel-logger will detect the error and log it to both IPMI SEL and Redf=
ish at the same time:
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fopenbmc%2Fphosphor-sel-logger%2Fblob%2Fmaster%2Finclude%2Fthreshold_e=
vent_monitor.hpp%23L272&amp;data=3D04%7C01%7Cjayashree-d%40hcl.com%7C1e6f28=
7fb3d24d154be508d91f11ef7d%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C637=
574984193449537%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D8JHAtQ7FBZSDtVoM3b0MGi2O=
hBQDNB16j0Pko0jg7p8%3D&amp;reserved=3D0.

It may also depend on how you are manually injecting the error.

>>
>> Could you please help me in this.
>>
>> Thanks,
>> Jayashree
>>
>> ::DISCLAIMER::
>> ________________________________
>> The contents of this e-mail and any attachment(s) are confidential=20
>> and intended for the named recipient(s) only. E-mail transmission is=20
>> not guaranteed to be secure or error-free as information could be=20
>> intercepted, corrupted, lost, destroyed, arrive late or incomplete,=20
>> or may contain viruses in transmission. The e mail and its contents=20
>> (with or without referred errors) shall therefore not attach any=20
>> liability on the originator or HCL or its affiliates. Views or=20
>> opinions, if any, presented in this email are solely those of the=20
>> author and may not necessarily reflect the views or opinions of HCL or i=
ts affiliates.
>> Any form of reproduction, dissemination, copying, disclosure,=20
>> modification, distribution and / or publication of this message=20
>> without the prior written consent of authorized representative of HCL=20
>> is strictly prohibited. If you have received this email in error=20
>> please delete it and notify the sender immediately. Before opening=20
>> any email and/or attachments, please check them for viruses and other=20
>> defects.
>> ________________________________
>>
>
> Hi Jayashree,
>
> I suggest you connect with Jason Bills on SEL.
>
>


