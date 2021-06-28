Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B113B6A0C
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 23:15:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDL413yYTz3bV1
	for <lists+openbmc@lfdr.de>; Tue, 29 Jun 2021 07:15:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=InventecCorp.onmicrosoft.com header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-InventecCorp-onmicrosoft-com header.b=XpPEOjDk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=40.107.132.93;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=mohammed.habeeb@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=XpPEOjDk; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320093.outbound.protection.outlook.com [40.107.132.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDL3d6KLRz30BK
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jun 2021 07:15:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2ZdtK1XyzSzf56CzFkdvvyW3NWAp4wU/995u4anaoArbTZaftndTmePGUuVFFDiTHH15wsaOh//LqJKOreaEmUhrFOI8MVawnhjGqQEVt+tEfyJe4gYGhSRyf9IZ6GfsTY27rAgVBEPpzL6QkztuGewk7roRctm4FZfMyRcdQEK/+5YcRC1vh44+VmJhx7uiBK1Tv8lkbDFc4LSjb8E/Gq6AHV33DykmS0z8FlnMT6GAvXR4jVPXQBGKq/hQm24tdWPk/+mE5K5ZVawkcCb2LTV2PJYR+N6eb39TKdVWQTumXjhkvoXICD6O+On5ZOaCANNss/Sez8aRgrJ1y13qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8322sPb9aNG5LbOAmpqUQLHGYZ5xIRKKrP/kZ9nIws=;
 b=YfFnJjOTeoSzLJbskgL7DHbjKeoi7bGmfH8Hl2ruZe27/WSLHfZl2bptMoFxbjkD35U+E47taDuog+hBgJOr+WXqbgRMAT88PJ1baOtYmXVwQwZzYk1OFaEvHDfPA48VrNhGUJb+ceWAbaczCzc7JESmJ5ZKStpr1c/FSjWWgYOTNJk6hZT3e+QgMDePeuZTig2AyVHm3tq/HdB+iR8g5ZwaaOpFOqrCuaAE0R02AVaJav6l6Q9AwNUITM+Pe6ST4RHbv/4jgzJ49JL2/ZOCfXBub90jxRAXURXLhl/TjmYLAbqxDxwtF3xuAqZta0SQFMv+OCCsrvsaUx8MlWyh3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8322sPb9aNG5LbOAmpqUQLHGYZ5xIRKKrP/kZ9nIws=;
 b=XpPEOjDkjNnq9Krr6CSE3pVNXeQNdqpmfmIdGLMnTOcO5c6HjF7WumEkzdXUWK4EfS2ToEp/xHVl7X9x1zGj8NZXwZsDmetR1e3Wp9Tj14bz5dstg5qqeYfCYis+CTrVnXj7HUUEJqb6weSLt4fLt/UJza7275hGrjGKNU0mmHM=
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com (2603:1096:300:48::10)
 by PSAPR02MB4807.apcprd02.prod.outlook.com (2603:1096:301:75::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Mon, 28 Jun
 2021 21:14:49 +0000
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::2d1b:bef0:9c06:4dc2]) by PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::2d1b:bef0:9c06:4dc2%6]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 21:14:49 +0000
From: Mohammed.Habeeb ISV <mohammed.habeeb@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: create telemetry metric report definition
Thread-Topic: create telemetry metric report definition
Thread-Index: AddsYYLoUG1yzyDkQsakWJDGm6PY8A==
Date: Mon, 28 Jun 2021 21:14:49 +0000
Message-ID: <PS2PR02MB354169FE1A228DAB09D78A8B90039@PS2PR02MB3541.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=inventec.com;
x-originating-ip: [207.140.31.146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16970029-3ca2-42ce-0ea4-08d93a79c38a
x-ms-traffictypediagnostic: PSAPR02MB4807:
x-microsoft-antispam-prvs: <PSAPR02MB4807952920C47C843F8A865590039@PSAPR02MB4807.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w4o8pimVxVdPAJpUCxUOcZ9q2evcdS1bkyZAZuKF2r4eH1U3jGIJ1hJhA2kbLOWvfkbXIpzeePhs8gbfGX0iqUXg+LDuVU2fsJ7RdMhcL0UhJkTV2QpmW837Y0LYqCEh6RH6qwe5fBco5iCnLu8h/duTCWPRgni/00xfTWjurInNe75Tak0GcPo+u8ipxqxMqh6u4FSOSAxZclAMGQudylqQda+3X92g+8hled95MuwWBpNGPwPMvue6pb9rphWIY4mIiqWn06ZGpcXQmB7LlkMT8CSs4t2RhUNuVqDr0At2WooAwVSpLWnI9k58KHYlXUSLEgAgJGIq4ELElYLaSVvExsgokRk70Jb9OtfpYUCniKKg8XiUJlIXMkw/VqVtoHtJWGbTI8IaTWBDPxzqfWxw2wG3KDAHxKP/7kJy0TNyTjYzkgov5fF7duccYelwtznhs+oUIZhzSsaLg+tiR7+6xBsKHILtDzHCv3mOBAFTgTDJt5M0HFKzLl0lUFzdrR8fX6r6AoqNXGfTxyKqrG0eIBYh2HcQUvL1hsVhU2KTDZCZxDSbvhj6CSK20IzNG1jUotATcXI1D0cToCLKUzs3eQdRyMe148ku2Wqa9j6r7AJYewyOX4vARP9JmDhukdjILDLRHmOoRxQ3cAcw/A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS2PR02MB3541.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(39840400004)(366004)(376002)(2906002)(7696005)(55016002)(8936002)(9686003)(26005)(6506007)(316002)(66946007)(52536014)(478600001)(8676002)(5660300002)(6916009)(86362001)(186003)(76116006)(64756008)(71200400001)(66556008)(33656002)(122000001)(38100700002)(66476007)(83380400001)(66446008)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cbxJ14txE01UlqF9F3EZpxlx6h7FdDAFSExWTqsIiaw0fuDnrfhvbeM1w9GY?=
 =?us-ascii?Q?6uqSR4QWhVS/a1lEL6VTpyortUajrNijPaP7t1203Lilr6CwpPjdmGs5UHHb?=
 =?us-ascii?Q?w3+XQThtOjveXXtZDQqRzRtQmm+tEkFmOwwrxFEfdlrzFHL8pLfF8LBD2I89?=
 =?us-ascii?Q?mUuBztyPrs4fZIfjVCsCLgjzO+GEQJ8C29nIThAv5uSPBPBi/fmc80obyk7D?=
 =?us-ascii?Q?U2jdVvOY33R2HHW4bdF7F8KLmS1U+ijhNQZltCZnWCtqgFfDiKCqTOviMlIp?=
 =?us-ascii?Q?Xxlt24O1zIyUGPMIvI07wMLOpIzRUoYFWGbBxkdfHwD87F433skAV1wmy+i4?=
 =?us-ascii?Q?jXH8otA9rr7gOYOmO6mrd5ebPlfdjbbloHRt5Dc4caifjCGEEdheIpcB3OVk?=
 =?us-ascii?Q?DZvVdTITuWkN25fkg0ZtGmShV+3RZS+j+9KYGsAMnte0EPCH9o05WgXa56MC?=
 =?us-ascii?Q?o4AQbUhNDeG6osQdaC2FwvsjK/se96R2yI2fjK9gDNLJjhI8RSiAZNBdm806?=
 =?us-ascii?Q?rh0oYKS3hqN/OU0be/oQpQZJzk8D2zeV6lRQCHEFY5Ze18H+RcyrnM0++AQ1?=
 =?us-ascii?Q?SaAO7/2Ff5XVqwa4zMKAebz5dFhFdL2pxFzoEEXZJkAt2GyIGFWtc2eMe1BE?=
 =?us-ascii?Q?74FgoN92hOJo1ho7bVQlqcvd5RTRZUKO8Zz0RDQ2XzrZCXQOvdHDSoF8vgAT?=
 =?us-ascii?Q?7zBXD7qexuyMUJ+wjhooPIc0wouVAcKM/Ogz1ouJ387Of31toOL7Tcacdikp?=
 =?us-ascii?Q?j+uNdsz3qT4bb5Z4dIkMrhYqlwdj1to6dfkYXN3qgaFZBHZsj+H6T5IsR7Qt?=
 =?us-ascii?Q?kDk3gLYNUSLcp2joHOdSAAEgJmv/FixDv16+KK6MDknTO/b4BDSCTlcorwVK?=
 =?us-ascii?Q?M2tkTE/4g8EVxlF9Z3STUxpO5glld9wh6deRpM19aJIsqQMIny5xRn574SGv?=
 =?us-ascii?Q?g+r8Qg9OLDmQ/RB0qTsRjrkqGUgCnuudE8Addr6EivRjUQEqAdxGuro95NBN?=
 =?us-ascii?Q?VMGYBduayq5GRyMHvrwZMay6mYk7RJdTvFmMICd55MaIQrakjyO+irORk6/r?=
 =?us-ascii?Q?QudQ+2sGyL0cGAwIJv7GCFIVbG6N1wBfLLtF9d74BFkOItgfedqhB+kBA41a?=
 =?us-ascii?Q?eUBHkipSEZw2oimwJjb5o3hUuatrOW1MQrwFEH9diBw0GzgLwi64H7w8GD71?=
 =?us-ascii?Q?8XaXE97hdxrrsPlJpST86BYw1qh44J0DqBO8HEJ0OvwtawXdnSWaW31EEdJR?=
 =?us-ascii?Q?65hbOJEvniyoREKjhiYY+Kak0DMkJUNe2QsLjUN9bA90TEEsM+Bd5g00rl18?=
 =?us-ascii?Q?jfUcGwWeP5iCvn135NIkbXel?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2PR02MB3541.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16970029-3ca2-42ce-0ea4-08d93a79c38a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2021 21:14:49.3765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ziMAK3j4pkXhlmvetg5A80cHq4hR91y6gYLu8h0SmFPHaUbEkrun/JdGclmljbOX2wc0d85BVUHC32rJaJj8Ik2JYakxSrqGFKPFwJ8/v4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR02MB4807
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi=20

How to create a telemetry metric report definition? I tried to set via dbus=
 command as below, but got an error.=20
 busctl call xyz.openbmc_project.Telemetry /xyz/openbmc_project/Telemetry/R=
eports xyz.openbmc_project.Telemetry.ReportManager AddReport MyMetric Perio=
dic 1 1 1000 "/xyz/openbmc_project/sensors/current/HSC_IOUT" "SINGLE" 1 "/r=
edfish/v1/Chassis/Transformers_MotherBoard/Sensors/HSC_IOUT/Reading"=20
Unknown signature type M.

Tried to use redfish also, but got an internal service error. Please let me=
 know if I miss anything here in both commands.
habeeb@nsit-160:~/openbmc_nibu06$ curl -k -H "X-Auth-Token: $token" -X POST=
 https://${bmc}/redfish/v1/TelemetryService/MetricReportDefinitions -d '{
 "Id":"MyMetric",
 "Metrics":[
	{
	 "MetricId": "HSC_IOUT_reading",
	 "MetricProperties":
 ["/redfish/v1/Chassis/Transformers_MotherBoard/Sensors/HSC_IOUT/Reading"]
 	}
 	],
 "MetricReportDefinitionType": "Periodic",
 "ReportActions": ["RedfishEvent", "LogToMetricReportsCollection"],
 "Schedule": {
 	"RecurrenceInterval": "PT1S"
 	}
 }'

{
  "error": {
    "@Message.ExtendedInfo": [
      {
        "@odata.type": "#Message.v1_1_1.Message",
        "Message": "The request failed due to an internal service error.  T=
he service is still operational.",
        "MessageArgs": [],
        "MessageId": "Base.1.8.1.InternalError",
        "MessageSeverity": "Critical",
        "Resolution": "Resubmit the request.  If the problem persists, cons=
ider resetting the service."
      }
    ],
    "code": "Base.1.8.1.InternalError",
    "message": "The request failed due to an internal service error.  The s=
ervice is still operational."
  }
}
---
I see xyz.openbmc_project.Telemetry.ReportManager Interface is present.
sysadmin@transformers:~# busctl tree --no-pager xyz.openbmc_project.Telemet=
ry
`-/xyz
  `-/xyz/openbmc_project
    `-/xyz/openbmc_project/Telemetry
      `-/xyz/openbmc_project/Telemetry/Reports

Regards
Habeeb
