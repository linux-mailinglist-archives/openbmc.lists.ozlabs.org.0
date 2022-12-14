Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D9664D735
	for <lists+openbmc@lfdr.de>; Thu, 15 Dec 2022 08:21:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXkDt3ldhz2xkD
	for <lists+openbmc@lfdr.de>; Thu, 15 Dec 2022 18:21:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=FbgU5DpE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.20.56; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=FbgU5DpE;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NX2GT3qBsz3bM7
	for <openbmc@lists.ozlabs.org>; Wed, 14 Dec 2022 15:20:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdvuc9UyS6bfQcELdrDhQBCf2/ri2rkS+naYXvS+qR3g/1H4VfwLFBj67pWLKRVvrCEULXLnyc2mU4b1t5l2yzb1+EiW8Pm54P4I9S6pOexMZWYE5rYGMTmx4TcSt7OKW19AWhdalma1I6TdzUmEfu2RuuWPWg7JZb6LneEz2giJafbZIC6ygk8yY2SL5bvIaTNG+k8aYAv8JmDUatwtoDeOCYPZ4X2Z62JhC014n+FgiAE3+wnui7/h0y3bBRuSx4GvGMGgzzpPx6LcmHE7yqQGGCWwectwkODzjZo3ksFYOGioLKk49d91C07vnGTSII+xsKfMuGWggXAReYFTrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81jCAdeWeoBNB92Dp1bE1KK0f970OpZrvu7AIs5Rj6E=;
 b=eumElgvxLfa285O5oGKYRVLvviKJC4ONL0XsgAokSF5En4c1IHu8NhppNiAtvk34SfPYURby/wZwlQfypYNhErz5q4/E/U6aIntQ5nyWFAhfBKzBTWZVf8cwM7UcxP9TBI0Y3olPD5ZwadkcDPNkjpLB6A4wNbWQKTUJaiFdQJpXcQm7Cbvl9w2ANIc83pY9Dv4GHWN7TrFgooUyFVFkxnWtAgK+1Oa2/bWendST5mQzIhY2TW2MsiVrGqt/EfojrIrURGYKCWNdiNBJXSnAhBFp1ibrWvpEln9mp1a19RJsJeqMxo65bO9l5fhEKlV7YpG2QUkaxN4HKyFwTXA1gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81jCAdeWeoBNB92Dp1bE1KK0f970OpZrvu7AIs5Rj6E=;
 b=FbgU5DpERWwxTDpiv+Abfch1ST8kYOj+9Taq0IQmpJgh1K3JA/0RZ1voECbrVWSOWm4XnfXcFzQSvrhcZMOzurku3zqRaFbSe/PbU+PUU8PZ7P3WQ9qsUqmVOjDvQb2fED5R+vLDNn+FxIuD3Y7FPXwt1UzFZuI+sMaT2G/Hh3M=
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com (2603:10a6:3:24::22)
 by DBBPR04MB7770.eurprd04.prod.outlook.com (2603:10a6:10:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 14 Dec
 2022 04:20:13 +0000
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::203a:e5da:a4a:7663]) by HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::203a:e5da:a4a:7663%12]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 04:20:13 +0000
From: Frank Li <frank.li@nxp.com>
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Chanh Nguyen <chanh@os.amperecomputing.com>
Subject: RE: [EXT] Re: [PATCH] USB: gadget: Add ID numbers to configfs-gadget
 driver names
Thread-Topic: [EXT] Re: [PATCH] USB: gadget: Add ID numbers to configfs-gadget
 driver names
Thread-Index: AQHZD3LJSHwlmMbNUUCrwfAuH4QtB65sxxGA
Date: Wed, 14 Dec 2022 04:20:13 +0000
Message-ID:  <HE1PR0401MB23315376796AF65DEB8B636B88E09@HE1PR0401MB2331.eurprd04.prod.outlook.com>
References: <20221213041203.21080-1-chanh@os.amperecomputing.com>
 <720b814d-5102-04d3-4938-33a25e87a46d@wanadoo.fr>
 <6044a542-fbcd-0fe7-abd3-83f38b731ecc@amperemail.onmicrosoft.com>
In-Reply-To: <6044a542-fbcd-0fe7-abd3-83f38b731ecc@amperemail.onmicrosoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR0401MB2331:EE_|DBBPR04MB7770:EE_
x-ms-office365-filtering-correlation-id: 4f08b1f1-9f5a-4638-0e50-08dadd8a7f52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  BIvfxHPTnvol5yHTuO6aU5IhaGpjUbJQXw082U2XKxUrgZbQ1GLUTBYJWuBEvHv5YUHUI7d16XQfUZ1sCv6X5BRBehgN7lMKVn5qvSyRBPDKUTT3ei/cKPgXYtBEBPqipuCjs5f48wcJd4pnjYKBB1WgcIupHxow/nRuM4sYuMWbG8XQhF8+YjTAYYVAS/4L/e36SPtJti77ByPgnWx3WtFe1uL81KvM/gFACbWoMy6oejJSjO5JGIoqjEfT5VbHhd1u47Q2ZAUEOF0esWDyyYrWRsHE3BY5bShr6RweNM/4HTV7McAMm+ipq7TmSbavUTSTciKgX+vItAWgB4kilBH2KcNSSQj9IlIpgz70nynGA39gNrZZT1Vusq+g/G4cyn0vp4Zjw6SBj52FVRuKH3iiFi63ZCnTMcTxWJBTAGpKPAyWAGBNkLvy5PDe+iU3bUPGnGRqNDiiTWVaSrBvaLEFUk2SUMYQEBtg3T7Nl1OCBZkMMG/m/ej0HZ3WTL5EgNFw1Lz8F7QsmKZzGmteTLtYoSlZiE+B3/F3C2MLQ8oVsqQsdu1H9NXSOC3HHv6sUHW2ScP1kZf4SNX13tUvBduP6+hmjxVV/W7V4WbRwtgIE1Q57YiCQIQVUZD1oYJaA6XTrC/a2xIxcWtbcj8YlchCnLDXdJKYeq+BVdHjRaBzNikxgpwLZFpUA92e1n0J9jrRNJDDt3mQp7UF0dE89A==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0401MB2331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199015)(33656002)(54906003)(4326008)(110136005)(316002)(296002)(66556008)(8676002)(66946007)(41300700001)(64756008)(38070700005)(66476007)(76116006)(66446008)(83380400001)(38100700002)(122000001)(55016003)(86362001)(6506007)(7696005)(71200400001)(52536014)(8936002)(7416002)(5660300002)(2906002)(44832011)(26005)(186003)(478600001)(55236004)(9686003)(53546011)(66574015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SkFSbmJXY2dkYzIxSk5PUjhrT01LR3c2MDhkdlJNaGZuVVVNaXFzUUMyTTFs?=
 =?utf-8?B?ZEpBTmk5ajhrMVlVTDJyZjBqd2ZVTEQwWUIvV0M4aWlpSUFhTXJxL2ttSW1p?=
 =?utf-8?B?aXA3c3hFNzlUYlBnMTl2YmRDOTFzL1N4RTRsT3V4bDIyT0lqWkxJQjUwbUds?=
 =?utf-8?B?QnJ1VXRWY3FBa0h4U1pmMFhVMVF3N3ZHNnhVeUcxVmNhWXpoYzcyQnZIVU1q?=
 =?utf-8?B?YTVIMXorSVorOUYzMlFvUzBIOXkvUkUxQXNUTmo5TEYxTGN0ay9BY2RJeHBT?=
 =?utf-8?B?TmVLL3lubk1uZ1VRdktIakVadTlSUUlkbCtUUko4NmxSa3NKdU80dnBkZjNW?=
 =?utf-8?B?dGw3TkZsbkVDbjQweFZ0REJNSFBySDd2Z0o0VEJ0WlU1aFhvcG1yZS9ueXk0?=
 =?utf-8?B?Q0hQbzFNRXc4SDUxcnR1bUpJS2hrQWhyQWZBc2IySHlmSklaQkRlK2NYVUZS?=
 =?utf-8?B?ZXIwamJXMzUraklwNkkrWFZBdGQzWDFwaWxIZEJvQWtwaHlDRzFzMU9jYndN?=
 =?utf-8?B?QmZqcno5R25TNTVFREE5SEFPWDNSL3Vhb014RUJvamhTWjVMSGVJNHNHbXpC?=
 =?utf-8?B?WjVOUm9CZ3lFaURabXNDNHVqQVVveVJHc3A0Y2JYSEtLVnJtQktPR09XYVZZ?=
 =?utf-8?B?VlBxdW85ZHQ1cDU3YlJ6WDRYelJpR1dhUlhJUXhTclNxVDMzekFDcFBSOTdj?=
 =?utf-8?B?MU85WDlSV2ZwSG9WT2VHWFNtRkhaU1JCS2N6K3JoS3VRVGdUdnRTakhxYmlZ?=
 =?utf-8?B?SndReVBDWHdUdVdqQWtHa2NFcnluQ1JhSm9KZTNrQ0dmcjVlSmdiOFVTRjJV?=
 =?utf-8?B?OUcwekpSRWwxd3gveTJDaE44WE5zZkFTNHFiUTNud2o4TzkzeE1TNmVES3Nl?=
 =?utf-8?B?ZExMMHpDMUlSM3QzMnpxRXM2NUMzbVVjYnZvMndnVG85K1JhYTJlNUZKM2FF?=
 =?utf-8?B?L1pOTFlyN21lalFTRWhDTy8rRHJ0eXEyM21pZVMycWlFcS9HWXhaM0dySzRj?=
 =?utf-8?B?MlA0cklnQWhLNXg2dm4ySWhvSTZuMGFPMnZjMVpGRlZJaFVZYVVDVVltNkx6?=
 =?utf-8?B?WmFyWFh1UmcvWGdKRER2bWNGM1JZZ1BEOEwwVk45cU0wczcva2g0aW5SSkJp?=
 =?utf-8?B?Q0JrQlYxMGFzYkdHbjZWVFh2N1ZlNW1qeU5HYy9tOUdIYmZsbFM5ZFNWc0V2?=
 =?utf-8?B?Ty9TRlJJdGk0dUZBcnlDRWNnRkYrYXdTUCtMU2VIdWlUSDVvSkRNMjFWY0Jz?=
 =?utf-8?B?Nll1TGRSbjhUSEN4UUxlM3MxZjJaVzFWZVR1VUpVZkI1NWQ1aW5veDJPVmNx?=
 =?utf-8?B?aStHWTNUTzkvNHd3d3VaN25zYUxDaWZPSC95RWZzV3h2OS9YVHFmTkxpNUxs?=
 =?utf-8?B?V2l1Y3VScnRjZE02K1ZLUkpjQnROR2hHY1F5M0d6a1N6NUtoSHorWENZVDRL?=
 =?utf-8?B?OER1aFFXMkU4d0VFenB3b1UxZVlMKzB3R3hPaW1YaFpzS3NTeHNqQW9MQmJi?=
 =?utf-8?B?LzljRXlsb0R1eFZZandjL3ViV29XSWVKU3VrbDlXYkEvTm14em94amU0aEtN?=
 =?utf-8?B?MDZsRCtRNVZwejFEQ3Jsemh5cWFDSE9POFVVYjN5MldQVVcrMUJDZHo1ZnJP?=
 =?utf-8?B?dGVjem9YcXJtTHo5VFBvZENBOTBDZldyaTgrRTJzUnBFc2tVdGFMWlF5aUNs?=
 =?utf-8?B?UkFqN1F5eTlsVVZWV09YV3FXbVhCK296M2p3TDZka3pQOXJhcThveXZ2bVR3?=
 =?utf-8?B?QUJod2Vaa1NQc3hKTVNTaklnU3FVZHJ0VEg2b3NmRSt1V29wS3gxWGcyMlNG?=
 =?utf-8?B?YWY1WE9zSGJ3eFZqTWhoOWlLNDFGOEpFaFFxVXplaVBtcEo0aHJZL2pJWUJI?=
 =?utf-8?B?d1dPb3N2MmNFQ0dubGNhVEt4MEJUblBNTy9YYkRvNC9Ea2xVb3VhRDFTN3lW?=
 =?utf-8?B?NTZRNVI4VGMrUmExM2dSOUJmanFCL0hhY3JkOUxPbHNIOG83QUxWWTZMNGti?=
 =?utf-8?B?dHViMlY1Qlo1eXFvRzZQNlB5WkVUYWpLSzhqTFowQXNkdFVzOElXcFg0bWFi?=
 =?utf-8?B?WWRoOFRxdDU4eFlJYWNlQmZsbGMyd3BOU3BkOXdIdWRtVkpnUHVqeWxPdm9x?=
 =?utf-8?Q?CI2o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0401MB2331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f08b1f1-9f5a-4638-0e50-08dadd8a7f52
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2022 04:20:13.7343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z1NuW0z4wFEPj9WasU9mRieUuYfjixsvFAuiqU9MF2ZuJbvzgSIA1pcf6wgQAPuj5kzuD/SjTPktGLM+kN5YQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7770
X-Mailman-Approved-At: Thu, 15 Dec 2022 18:08:48 +1100
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dan Vacura <w36195@motorola.com>, Vijayavardhan Vennapusa <vvreddy@codeaurora.org>, Rondreis <linhaoguo86@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Jakob Koschel <jakobkoschel@gmail.com>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiANCj4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+IA0KPiBPbiAxMy8xMi8yMDIyIDE0OjIyLCBDaHJp
c3RvcGhlIEpBSUxMRVQgd3JvdGU6DQo+ID4gTGUgMTMvMTIvMjAyMiDDoCAwNToxMiwgQ2hhbmgg
Tmd1eWVuIGEgw6ljcml0IDoNCj4gPj4gSXQgaXMgdW5hYmxlIHRvIHVzZSBjb25maWdmcyB0byBh
dHRhY2ggbW9yZSB0aGFuIG9uZSBnYWRnZXQuIFdoZW4NCj4gPj4gYXR0YWNoaW5nIHRoZSBzZWNv
bmQgZ2FkZ2V0LCBpdCBhbHdheXMgZmFpbHMgYW5kIHRoZSBrZXJuZWwgbWVzc2FnZQ0KPiA+PiBw
cmludHMgb3V0Og0KPiA+Pg0KPiA+PiBFcnJvcjogRHJpdmVyICdjb25maWdmcy1nYWRnZXQnIGlz
IGFscmVhZHkgcmVnaXN0ZXJlZCwgYWJvcnRpbmcuLi4NCj4gPj4gVURDIGNvcmU6IGcxOiBkcml2
ZXIgcmVnaXN0cmF0aW9uIGZhaWxlZDogLTE2DQo+ID4+DQo+ID4+IFRoaXMgY29tbWl0IGZpeGVz
IHRoZSBwcm9ibGVtIGJ5IGEgIi5OIiBzdWZmaXggYWRkZWQgdG8gZWFjaA0KPiA+PiBjb25maWdm
c19nYWRnZXQncyBkcml2ZXIgbmFtZSAod2hlcmUgTiBpcyBhIHVuaXF1ZSBJRCBudW1iZXIpLA0K
PiA+PiB0aHVzIG1ha2luZyB0aGUgbmFtZXMgZGlzdGluY3QuDQo+ID4+DQo+ID4+IEZpeGVzOiBm
YzI3NGMxZTk5NzMgKCJVU0I6IGdhZGdldDogQWRkIGEgbmV3IGJ1cyBmb3IgZ2FkZ2V0cyIpDQo+
ID4+IFNpZ25lZC1vZmYtYnk6IENoYW5oIE5ndXllbg0KPiA+PiA8Y2hhbmgtc2hleDZNTlFSMkov
U2ZEemY3OGF6ekt6RUR4WWxlWERAcHVibGljLmdtYW5lLm9yZz4NCj4gPj4gLS0tDQo+ID4+ICAg
ZHJpdmVycy91c2IvZ2FkZ2V0L2NvbmZpZ2ZzLmMgfCA0Mg0KPiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCsp
DQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvY29uZmlnZnMuYw0K
PiA+PiBiL2RyaXZlcnMvdXNiL2dhZGdldC9jb25maWdmcy5jDQo+ID4+IGluZGV4IDk2MTIxZDFj
OGRmNC4uZDhjNTE1NmFkNzc3IDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL3VzYi9nYWRnZXQv
Y29uZmlnZnMuYw0KPiA+PiArKysgYi9kcml2ZXJzL3VzYi9nYWRnZXQvY29uZmlnZnMuYw0KPiA+
PiBAQCAtMyw2ICszLDcgQEANCj4gPj4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4+
ICAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4gPj4gICAjaW5jbHVkZSA8bGludXgvZGV2aWNl
Lmg+DQo+ID4+ICsjaW5jbHVkZSA8bGludXgvaWRyLmg+DQo+ID4+ICAgI2luY2x1ZGUgPGxpbnV4
L2tzdHJ0b3guaD4NCj4gPj4gICAjaW5jbHVkZSA8bGludXgvbmxzLmg+DQo+ID4+ICAgI2luY2x1
ZGUgPGxpbnV4L3VzYi9jb21wb3NpdGUuaD4NCj4gPj4gQEAgLTExLDYgKzEyLDE2IEBADQo+ID4+
ICAgI2luY2x1ZGUgInVfZi5oIg0KPiA+PiAgICNpbmNsdWRlICJ1X29zX2Rlc2MuaCINCj4gPj4g
K3N0YXRpYyBERUZJTkVfSURBKGRyaXZlcl9pZF9udW1iZXJzKTsNCj4gPj4gKw0KPiA+PiArLyoN
Cj4gPj4gKyAqIERyaXZlciBuYW1lIGhhcyB0aGUgZm9ybSBvZiAiY29uZmlnZnMtZ2FkZ2V0LiVk
Iiwgd2hlcmUgJWQNCj4gPj4gKyAqIGlzIGlkIGFsbG9jYXRlZCBieSBpZGFfYWxsb2MoKS4gVGhl
IG1heCB2YWx1ZSByZXR1cm5zIGJ5DQo+ID4+ICsgKiBpZGFfYWxsb2MoKSBpcyBJTlRfTUFYLCBp
biA2NC1iaXQgc3lzdGVtLCBpdCBpcyBhYm91dCBuaW5lDQo+ID4+ICsgKiBxdWludGlsbGlvbjog
MTkgZGlnaXRzIGluIGRlY2ltYWwuIFNldCB0aGUgbWF4IGxlbmd0aCB0byAzNS4NCj4gPj4gKyAq
Lw0KPiA+PiArI2RlZmluZSBEUklWRVJfTkFNRV9MRU5HVEhfTUFYIDM1DQo+ID4NCj4gPiBIaSwN
Cj4gPg0KPiA+IGlmIHBhcmFub2lhYywgdGhlIGZpbmFsIFwwIHNlZW1zIHRvIGJlIG1pc3Npbmcg
aW4gdGhlIG1heCBsZW5ndGgNCj4gPiBjb21wdXRhdGlvbiwgYnV0IHNlZSBiZWxvdy4NCj4gDQo+
IFRoYW5rcyBDSiEgSW5kZWVkLCBJIGhhdmUgbWlzc2VkIHRoYXQuDQo+IA0KPiA+DQo+ID4+ICsN
Cj4gPj4gICBpbnQgY2hlY2tfdXNlcl91c2Jfc3RyaW5nKGNvbnN0IGNoYXIgKm5hbWUsDQo+ID4+
ICAgICAgICAgICBzdHJ1Y3QgdXNiX2dhZGdldF9zdHJpbmdzICpzdHJpbmd0YWJfZGV2KQ0KPiA+
PiAgIHsNCj4gPj4gQEAgLTUyLDYgKzYzLDkgQEAgc3RydWN0IGdhZGdldF9pbmZvIHsNCj4gPj4g
ICAgICAgY2hhciBxd19zaWduW09TX1NUUklOR19RV19TSUdOX0xFTl07DQo+ID4+ICAgICAgIHNw
aW5sb2NrX3Qgc3BpbmxvY2s7DQo+ID4+ICAgICAgIGJvb2wgdW5iaW5kOw0KPiA+PiArDQo+ID4+
ICsgICAgLyogTWFrZSBkcml2ZXIgbmFtZXMgdW5pcXVlICovDQo+ID4+ICsgICAgaW50IGRyaXZl
cl9pZF9udW1iZXI7DQo+ID4+ICAgfTsNCj4gPj4gICBzdGF0aWMgaW5saW5lIHN0cnVjdCBnYWRn
ZXRfaW5mbyAqdG9fZ2FkZ2V0X2luZm8oc3RydWN0IGNvbmZpZ19pdGVtDQo+ID4+ICppdGVtKQ0K
PiA+PiBAQCAtMTU4Miw2ICsxNTk2LDggQEAgc3RhdGljIHN0cnVjdCBjb25maWdfZ3JvdXAgKmdh
ZGdldHNfbWFrZSgNCj4gPj4gICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUpDQo+ID4+ICAgew0K
PiA+PiAgICAgICBzdHJ1Y3QgZ2FkZ2V0X2luZm8gKmdpOw0KPiA+PiArICAgIGNoYXIgKmRyaXZl
cl9uYW1lOw0KPiA+PiArICAgIGludCByZXQ7DQo+ID4+ICAgICAgIGdpID0ga3phbGxvYyhzaXpl
b2YoKmdpKSwgR0ZQX0tFUk5FTCk7DQo+ID4+ICAgICAgIGlmICghZ2kpDQo+ID4+IEBAIC0xNjIz
LDYgKzE2MzksMjEgQEAgc3RhdGljIHN0cnVjdCBjb25maWdfZ3JvdXAgKmdhZGdldHNfbWFrZSgN
Cj4gPj4gICAgICAgZ2ktPmNvbXBvc2l0ZS5nYWRnZXRfZHJpdmVyID0gY29uZmlnZnNfZHJpdmVy
X3RlbXBsYXRlOw0KPiA+PiArICAgIHJldCA9IGlkYV9hbGxvYygmZHJpdmVyX2lkX251bWJlcnMs
IEdGUF9LRVJORUwpOw0KPiA+PiArICAgIGlmIChyZXQgPCAwKQ0KPiA+PiArICAgICAgICBnb3Rv
IGVycjsNCj4gPj4gKyAgICBnaS0+ZHJpdmVyX2lkX251bWJlciA9IHJldDsNCj4gPj4gKw0KPiA+
PiArICAgIGRyaXZlcl9uYW1lID0ga21hbGxvYyhEUklWRVJfTkFNRV9MRU5HVEhfTUFYLCBHRlBf
S0VSTkVMKTsNCj4gPj4gKyAgICBpZiAoIWRyaXZlcl9uYW1lKQ0KPiA+PiArICAgICAgICBnb3Rv
IG91dF9mcmVlX2RyaXZlcl9pZF9udW1iZXI7DQo+ID4+ICsNCj4gPj4gKyAgICByZXQgPSBzY25w
cmludGYoZHJpdmVyX25hbWUsIERSSVZFUl9OQU1FX0xFTkdUSF9NQVgsDQo+ID4+ICsgICAgICAg
ICAgICAiY29uZmlnZnMtZ2FkZ2V0LiVkIiwgZ2ktPmRyaXZlcl9pZF9udW1iZXIpOw0KPiA+DQo+
ID4NCj4gPiB1c2luZyBrYXNwcmludGYoKSBsb29rcyBzaW1wbGVyIGhlcmUuDQo+ID4gTm8gbmVl
ZCB0byBrbWFsbG9jKCkrc2NucHJpbnRmKCksIGFuZCBubyBuZWVkIGZvcg0KPiBEUklWRVJfTkFN
RV9MRU5HVEhfTUFYLg0KPiA+DQo+ID4gSnVzdCBteSAyYywNCj4gPg0KPiA+IENKDQo+IA0KPiBU
aGFua3MgQ0ogZm9yIHRoZSByZXZpZXchDQo+IA0KPiBJJ3ZlIG1hZGUgc29tZSBjaGFuZ2VzIGFz
IGJlbG93IChpbiBnYWRnZXRzX21ha2UoKSB0byByZW1vdmUNCj4gdW5uZWNlc3NhcnkNCj4gdmFy
aWFibGVzKSBhbmQgbm93IHRyeWluZyB0byB0ZXN0IGl0IGFzIG11Y2ggYXMgcG9zc2libGUuIFdp
bGwgcmUtcG9zdA0KPiBpdCBhcyB2MiBpZiBsb29rcyBnb29kIHNvb24uDQo+IA0KPiBzdGF0aWMg
aW5saW5lIHN0cnVjdCBnYWRnZXRfaW5mbyAqdG9fZ2FkZ2V0X2luZm8oc3RydWN0IGNvbmZpZ19p
dGVtICppdGVtKQ0KPiBAQCAtMTYyMywxMyArMTYyOSwyNSBAQCBzdGF0aWMgc3RydWN0IGNvbmZp
Z19ncm91cCAqZ2FkZ2V0c19tYWtlKA0KPiANCj4gICAgICAgZ2ktPmNvbXBvc2l0ZS5nYWRnZXRf
ZHJpdmVyID0gY29uZmlnZnNfZHJpdmVyX3RlbXBsYXRlOw0KPiANCj4gKyAgICBnaS0+ZHJpdmVy
X2lkX251bWJlciA9IGlkYV9hbGxvYygmZHJpdmVyX2lkX251bWJlcnMsIEdGUF9LRVJORUwpOw0K
PiArICAgIGlmIChnaS0+ZHJpdmVyX2lkX251bWJlciA8IDApDQo+ICsgICAgICAgIGdvdG8gZXJy
Ow0KPiArDQo+ICsgICAgZ2ktPmNvbXBvc2l0ZS5nYWRnZXRfZHJpdmVyLmRyaXZlci5uYW1lID0N
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAga2FzcHJpbnRmKEdGUF9LRVJORUwsICJjb25m
aWdmcy1nYWRnZXQuJWQiLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Z2ktPmRyaXZlcl9pZF9udW1iZXIpOw0KPiArICAgIGlmICghZ2ktPmNvbXBvc2l0ZS5nYWRnZXRf
ZHJpdmVyLmRyaXZlci5uYW1lKQ0KPiArICAgICAgICBnb3RvIG91dF9mcmVlX2RyaXZlcl9pZF9u
dW1iZXI7DQo+ICsNCj4gICAgICAgZ2ktPmNvbXBvc2l0ZS5nYWRnZXRfZHJpdmVyLmZ1bmN0aW9u
ID0ga3N0cmR1cChuYW1lLCBHRlBfS0VSTkVMKTsNCj4gICAgICAgZ2ktPmNvbXBvc2l0ZS5uYW1l
ID0gZ2ktPmNvbXBvc2l0ZS5nYWRnZXRfZHJpdmVyLmZ1bmN0aW9uOw0KPiANCj4gICAgICAgaWYg
KCFnaS0+Y29tcG9zaXRlLmdhZGdldF9kcml2ZXIuZnVuY3Rpb24pDQo+IC0gICAgICAgIGdvdG8g
ZXJyOw0KPiArICAgICAgICBnb3RvIG91dF9mcmVlX2RyaXZlcl9pZF9udW1iZXI7DQo+IA0KPiAg
ICAgICByZXR1cm4gJmdpLT5ncm91cDsNCj4gKw0KPiArb3V0X2ZyZWVfZHJpdmVyX2lkX251bWJl
cjoNCj4gKyAgICBpZGFfZnJlZSgmZHJpdmVyX2lkX251bWJlcnMsIGdpLT5kcml2ZXJfaWRfbnVt
YmVyKTsNCj4gICBlcnI6DQo+ICAgICAgIGtmcmVlKGdpKTsNCj4gICAgICAgcmV0dXJuIEVSUl9Q
VFIoLUVOT01FTSk7DQo+IA0KPiANCj4gPg0KPiA+PiArICAgIGlmIChyZXQgPCAwKQ0KPiA+PiAr
ICAgICAgICBnb3RvIG91dF9mcmVlX2RyaXZlcl9uYW1lOw0KPiA+PiArDQo+ID4+ICsgICAgZ2kt
PmNvbXBvc2l0ZS5nYWRnZXRfZHJpdmVyLmRyaXZlci5uYW1lID0gZHJpdmVyX25hbWU7DQo+ID4+
ICAgICAgIGdpLT5jb21wb3NpdGUuZ2FkZ2V0X2RyaXZlci5mdW5jdGlvbiA9IGtzdHJkdXAobmFt
ZSwgR0ZQX0tFUk5FTCk7DQo+ID4+ICAgICAgIGdpLT5jb21wb3NpdGUubmFtZSA9IGdpLT5jb21w
b3NpdGUuZ2FkZ2V0X2RyaXZlci5mdW5jdGlvbjsNCj4gPj4gQEAgLTE2MzAsNiArMTY2MSwxMSBA
QCBzdGF0aWMgc3RydWN0IGNvbmZpZ19ncm91cCAqZ2FkZ2V0c19tYWtlKA0KPiA+PiAgICAgICAg
ICAgZ290byBlcnI7DQo+ID4+ICAgICAgIHJldHVybiAmZ2ktPmdyb3VwOw0KPiA+PiArDQo+ID4+
ICtvdXRfZnJlZV9kcml2ZXJfbmFtZToNCj4gPj4gKyAgICBrZnJlZShkcml2ZXJfbmFtZSk7DQo+
ID4+ICtvdXRfZnJlZV9kcml2ZXJfaWRfbnVtYmVyOg0KPiA+PiArICAgIGlkYV9mcmVlKCZkcml2
ZXJfaWRfbnVtYmVycywgZ2ktPmRyaXZlcl9pZF9udW1iZXIpOw0KPiA+PiAgIGVycjoNCj4gPj4g
ICAgICAga2ZyZWUoZ2kpOw0KPiA+PiAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4g
Pj4gQEAgLTE2MzcsNiArMTY3MywxMiBAQCBzdGF0aWMgc3RydWN0IGNvbmZpZ19ncm91cCAqZ2Fk
Z2V0c19tYWtlKA0KPiA+PiAgIHN0YXRpYyB2b2lkIGdhZGdldHNfZHJvcChzdHJ1Y3QgY29uZmln
X2dyb3VwICpncm91cCwgc3RydWN0DQo+ID4+IGNvbmZpZ19pdGVtICppdGVtKQ0KPiA+PiAgIHsN
Cj4gPj4gKyAgICBzdHJ1Y3QgZ2FkZ2V0X2luZm8gKmdpID0gdG9fZ2FkZ2V0X2luZm8oaXRlbSk7
DQo+ID4+ICsNCj4gPj4gKyAgICBtdXRleF9sb2NrKCZnaS0+bG9jayk7DQo+ID4+ICsgICAga2Zy
ZWUoZ2ktPmNvbXBvc2l0ZS5nYWRnZXRfZHJpdmVyLmRyaXZlci5uYW1lKTsNCj4gPj4gKyAgICBp
ZGFfZnJlZSgmZHJpdmVyX2lkX251bWJlcnMsIGdpLT5kcml2ZXJfaWRfbnVtYmVyKTsNCj4gPj4g
KyAgICBtdXRleF91bmxvY2soJmdpLT5sb2NrKTsNCg0KTW92ZSBhbGwgZnJlZSBpbnRvIGdhZGdl
dF9pbmZvX2F0dHJfcmVsZWFzZSgpLCBqdXN0IGJlZm9yZSBrZnJlZShnaSkNCkRyaXZlci5uYW1l
IGFuZCBnaSBjcmVhdGUgYXQgdGhlIHNhbWUgcGxhY2UsIA0KRnJlZSBzaG91bGQgYmUgdGhlIHNh
bWUgcGxhY2UgYWxzby4gDQoNCkJlc3QgcmVnYXJkcw0KRnJhbmsgTGkNCg0KPiA+PiAgICAgICBj
b25maWdfaXRlbV9wdXQoaXRlbSk7DQo+ID4+ICAgfQ0KPiA+DQo=
