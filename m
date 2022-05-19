Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7F752DDFF
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 21:57:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L40xl42sHz305D
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 05:57:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=KFDziKAy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=6138b10c62=pdel@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=KFDziKAy; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L40xJ0VgRz301N
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 05:56:45 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JFG4LW012923;
 Thu, 19 May 2022 12:56:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=Bf3nPhbRJYe/0D5S3Mu/2gM66pgxYGFiCdq20FRBRhg=;
 b=KFDziKAy6cdMYLZa/Xnkt7eGbEckMuuvcLhLpJtJNGdVujeA/Hx2YLsSdmY99S9dhrkw
 4v8qAfjv3hZaZ8nUhK3XNItZLVCP6hfQpqCmx4WsrpfX92d5qWRgbOPLQon0ls8YlDpc
 TR/eQZO73P7w/2FdoP2u8l/ibBkS1s7hCIc= 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g5b9vp479-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 12:56:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPiVlRfH1HBLnI1+6KiuFQQCsJYJ21kPhqwUczQL2BwZKH/Uo0rL2O+UqI5BWJFaXHlwj8k6SLKBAZe3Dn+FUP6F48pGS9kPyO69qHrytpdg+CNp3A4LhFn7mdnagYk1bSMYI9LcxCmTLAuFER1vztxriM1jTKoxUTkM07/3ab2Cr6bj3/14krWcJ9Xm9Pxqvl6awdb0HZR6j/7iudt12T6nIxTAwh5PFRBKKoR2UF368FnHGOLhcMsTdDsd4WbW3OMMXjCjj3PAmONqjQgjKxnmVgLevDMLHhJuX/kI3JsI8jF8MkiTNEOMoD1jBGPk+LERttF+8cp+0KZQT9/uxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bf3nPhbRJYe/0D5S3Mu/2gM66pgxYGFiCdq20FRBRhg=;
 b=WVKyRafUJBu+/wyjLjAwS1Hj+7M2ZzpXhmdS7WQ60++Zzs5DGtk/307EG8mIU1ujHuDxc3vHbodzMZVUCkTfazjEY2Dk9VCMV+q9RFoe8kr/73hjVZ6nZf1l7q/j8JDEYlxGaD+EgFo3JaKTjyc6vSkkDx59Xh/QcpHbuYFsszH/uAcbHWgEsVIyPrwsxhNbCvLqTsZ2LflPioZnKtQx0uDBv5gtyG9xz2Is3H9jKFWz2iRIbCmdTB00Ve/5dycTg6uRmBbJ1VRni23kD2lEhy5T0moI4oN8QFyVOY0JyKsfeyCp35tFD3GBWJE8OZtqyFpIRDlvD08+4ut9utewJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BN8PR15MB2754.namprd15.prod.outlook.com (2603:10b6:408:ce::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Thu, 19 May
 2022 19:56:24 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::45c5:2306:17b3:89eb%5]) with mapi id 15.20.5273.014; Thu, 19 May 2022
 19:56:24 +0000
From: Peter Delevoryas <pdel@fb.com>
Subject: Re: [PATCH v3 0/3] Add ASPEED AST2600 I2C new controller driver
Thread-Topic: [PATCH v3 0/3] Add ASPEED AST2600 I2C new controller driver
Thread-Index: AQHYaPFadatO4kmu/EiPkIJLA5AvH60moyWA
Date: Thu, 19 May 2022 19:56:24 +0000
Message-ID: <DDAAA045-3BDE-4712-A6CC-B1A52713634A@fb.com>
References: <20220516064900.30517-1-ryan_chen@aspeedtech.com>
In-Reply-To: <20220516064900.30517-1-ryan_chen@aspeedtech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00ba61bd-669e-4186-09b3-08da39d1a737
x-ms-traffictypediagnostic: BN8PR15MB2754:EE_
x-microsoft-antispam-prvs: <BN8PR15MB27540F9A0793CF08B3208F7CACD09@BN8PR15MB2754.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l+4w3vSq38PRF000LIeAHCcgnVDVrXqAVqob36L0yrvLQ7D91a3tU5W8glXSsEUgE50UwhTEsI3NCg/bMVI7pUnXdAOiun7fTwYISsczH2x+DgHSkCnSxEtGW9pjBAU8aY4I3gySpGqReOi/i1ernt6GvosDtfYVzszojfcDZ7lsaVLTCBE1EZ8dBuOOaURFC7QJKXbVpIh5rq7rnZRXnLi/XdBwdsImz8A9UUk1yQakmRzvakuiQ1KLkehHdmnFKMcH57joMNAfD2byBU5pl01wYHRNkn9c2bGRmd4FdYQr3xT7O88qVvPj9uM2fLwKYCdt8ZrcANw0FYnvxnr2bqLCIU2oaM2cpG7hJinR25LWNyfqUx2XGSLYo5twFotxrF/GGibpZFu1k/GrzvXxWmlDwCNOVgNEzf+qZj4srd09LScMlWlha5jCF5ejjOK7HKUmmnDSPihGIE6o8e+KbvG0f5GteQ/XGufsTmC3fMmKM85CvMn6CGpONYoVbDoymo2aEA8n36kZpSh7E7uk3ZCCpWZH1tvXnyicgOgZxqPfN4dqg7sTAwY0eWPKFLzAVc9S8NVDLU9CZsn9uDq2UBt4vzlP0bNFeDs5svq+TK0FTfejTM8cnvlONRUiHSj+8qqsAbyjjtBz7ssejF+ZSiqq3ujm+dYux4b2HAVhNgiqJHvjPPd+rXraxo/vTRe2eL9Y7C42X2kQTKzvIfCsRjZ/rfzVaGhluoaz6yqNQtI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(186003)(122000001)(6512007)(83380400001)(6506007)(4326008)(8936002)(508600001)(38070700005)(53546011)(66556008)(76116006)(66946007)(66476007)(66446008)(64756008)(36756003)(8676002)(54906003)(6486002)(5660300002)(71200400001)(38100700002)(316002)(86362001)(109986005)(33656002)(2906002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3VBWHRsYXBzYTR2S2hibVp3aXZ4eFN3VkhpclR6NElrQzkzbDRYNFZZYUZi?=
 =?utf-8?B?YUFOWEg4L0ltczN1Y0o1bUlRc2Y4Wm5oNCs5L0JCbjUzcmVHQmlNVTNLQ2l4?=
 =?utf-8?B?dnZ4aVYxcEtKQWlvU0tidDE4REdmMFYxQ2g1eWFVSnRZWlV1MU84NUFrbmpZ?=
 =?utf-8?B?R1RFNFdhQkQwYURIZ1R1VmZGdXQ3amVnM3lxbDh3eDg0V2dJT01KcXJ6a0pn?=
 =?utf-8?B?QUo5ZU91TlRsN2NvWXpTbyszSlFjMThGMkQ3N1Z0SEhHUmFJNUE2akIvdHdL?=
 =?utf-8?B?ZzBkckRLQXlNUk9Zb2F4bnlGUCtudythc054YXMxNHNTSXB5VkRyNHNBek9X?=
 =?utf-8?B?RDJCbzZrdzZacjdzM3VGRjV2TVBjN3F0TUsyYm41MmxuQVorbDNjd0pGZHU0?=
 =?utf-8?B?Y1BwSXd6MTZ4U2tCeFltbnkyY1dBL1R6ZE1GU1JuMXZhK01temFKdkVJNjFy?=
 =?utf-8?B?Smg5bnZSdnVkcUk1dTJyVXJtR3JjOWRuRy9TU0ZTTzNuWi9VOTIxSE5zUVdm?=
 =?utf-8?B?bHpBNFMwUyswME8wbGJUSENUY0hQMVo5dU5ENGVrUmJ6ZG1rZyt2bCtOYmph?=
 =?utf-8?B?eFZWK3VQaEpwSTBOWHdWUzNXQ2RnVWl0QWU2Q1dDNmxuNVpOdkZScDlDMy9t?=
 =?utf-8?B?SmpLZHQ2bFRidXhZVEx0OUdhb0YweS80OU9wc2R0NmlGTXNJRFFDNkt4Um9G?=
 =?utf-8?B?d0dhZWM0ZTkyZ1N6dmhpSXZTYllBQ0NienM5S0MzejU4SzlJZXEwQjUyZVFY?=
 =?utf-8?B?dmY5cWtJbVozYmR0dWpYSjlpUXlLT3RCY2lzc1RqeTZhRTVqLzJBTG1mRzZ5?=
 =?utf-8?B?LzJieGZBZnNaanZVUzllZzBWTmpxOFZMaFlydzg2NjVRd3NOanhNQmEvUi9J?=
 =?utf-8?B?WmhtTDA0NW4zdHE0MzNSWXlwUVJUS3B1VnVXTFg1RnFtWHdTVEhML3dvbVZC?=
 =?utf-8?B?S2E3cDBsMWUyM3Rlb09WdFRIQ3Z1K0pGeDBUVXpGWjJuenAwS2I3TVdoM2Nn?=
 =?utf-8?B?dTRJZ0E3TGZ6ODBUcElmWFFsOU9kS3pDeWpESk9mWWxEWEpuZ3QwdWFvNW9Q?=
 =?utf-8?B?U2luQjNEaWJRM1lNS1RIdXZ1MWE4S0IybGFxZTBRbG9pcGtheUJVZHRuUEtO?=
 =?utf-8?B?VEFYOTRCa3V1R29PdDE3RlQzTm9ObFBqeFVCdSswcFV3Y1YzblNOeGhPMU00?=
 =?utf-8?B?bHB3REVNVFhqbGd1U3EzNVZ5TTI0MmJ4MkYrdXpWVnZTVGhaRkdwQUN2Nmpk?=
 =?utf-8?B?Rk5tN2l1N25IS1VSUnBTMjI0WUJsMEY3VmhlQ2IrQ2hYOURSL3J2QnFERmVH?=
 =?utf-8?B?TDlYWG1WSzMrcnEvNzlUMnh1SWJuc1B0bW9sR1hIODhiMFVQL2g2Mjd5ODNz?=
 =?utf-8?B?dlRVbzh0cEpxenkwenFidm50SlpCcGdmdVFFYlgrLzl2Qm93V2R3WVhTMUdM?=
 =?utf-8?B?ekZDM3N6K2dJVHdqUFFvMnBBdmZjV0VVTmMrTVRDdC80Sk1qZlJmc1JJUjNr?=
 =?utf-8?B?ZklsQVpNbzBSSzNwSmhjRXY3MXBRclRibU9kc2RyRWJtbTVQNjQ0VG1BOHJT?=
 =?utf-8?B?andoeXhQcG85aHpHcXlKbFNlQ3ZtTHE0dnpkcGptb3BHelhFcTRYVE9iYWhw?=
 =?utf-8?B?MmdKTlBqVTBQZHZJV1dSekx6WWdlMElocEpuUWRONEFzbit5emZxL05KY242?=
 =?utf-8?B?bXdpbXg3VGo5RzRGc2pkc2x0eEl2Z1crTU5ZQzE0K1UzMVcvMWFyakFMTnUr?=
 =?utf-8?B?Y1M1VThiZThreC9OOENWOHBqaWJqU0FTK0xoeTlFMzhGeC94RXB2N1pGNlJj?=
 =?utf-8?B?U2FxTG1SNmRLUi9QS0ZGWEhHYm1rT1NIaVBBTC9MeHp2UUVCWGQ0TjZqSHc2?=
 =?utf-8?B?Zmd3ZEUvK1VVUU9qWXAxUktHUUhOclZZTHJMZUJDSlpBSWl2QkwvRkpkMHNx?=
 =?utf-8?B?NWJTd0VKNEowNHQ5QURjaXM0MkgxOXFpOHNvczVuVlp3R1k5dGlPTGJmdGYr?=
 =?utf-8?B?ZG1rOUxLQ1haMC9NTmkwT1Y5alo3d29SaDJBUy9pUVc5ZlFZRTNQYU85K0gv?=
 =?utf-8?B?RlF1ZlZMdnFHUjB4bjE3Vi9HSnRldmdOeHhJSEJTV0hRZ0NsOVY4S3dFT3hW?=
 =?utf-8?B?Wm9RTmx6ZVdFRXdZWGh6ZlhUaGVQRS83a1MrenJpeHd2bzJzTlZZZ0g4cEMx?=
 =?utf-8?B?VDNhRkxJcVpjMnArMW5uV2RmTVBGb3NhS1RNZE9VYU5zS1czcURKbHBWSzZw?=
 =?utf-8?B?T2NVazZCd1Bxd1ROdHVRT0JYNWVnWkF4OGc2Y1BNKzcyaFV4MDFBWSt0WGdR?=
 =?utf-8?B?ZGpObCtCZGprbit5a2l6eUN3WTgycVJQMTdGSkRqalZRWFl3N0Fic29ZK3dI?=
 =?utf-8?Q?8NFh/LULrMImLA+8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5034F89993E91245B65A45F289AD9390@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ba61bd-669e-4186-09b3-08da39d1a737
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2022 19:56:24.2540 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8oY4M9+l9JxhdxcFsCykRLFwzqeUkIiYYHpDX3JAKXsIL31RMhmuc/tU7kxa0t7X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR15MB2754
X-Proofpoint-GUID: YUDEqdxkFc4YjA0Xx7gN4ziGGAn7ADpX
X-Proofpoint-ORIG-GUID: YUDEqdxkFc4YjA0Xx7gN4ziGGAn7ADpX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-19_06,2022-05-19_03,2022-02-23_01
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
Cc: "BMC-SW@aspeedtech.com" <BMC-SW@aspeedtech.com>,
 "ryan_chen@aspeedtech.com" <ryan_chen@aspeedtech.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC List <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Joel Stanley <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>,
 Peter Delevoryas <pdel@fb.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCj4gT24gTWF5IDE1LCAyMDIyLCBhdCAxMTo0OCBQTSwgcnlhbl9jaGVuIDxyeWFuX2NoZW5A
YXNwZWVkdGVjaC5jb20+IHdyb3RlOg0KPiANCj4gVGhpcyBzZXJpZXMgYWRkIEFTVDI2MDAgaTJj
IG5ldyByZWdpc3RlciBzZXQgZHJpdmVyLiBUaGUgaTJjIG5ldw0KPiByZWdpc3RlciBzZXQgaGF2
ZSBuZXcgY2xvY2sgZGl2aWRlciBvcHRpb24gZm9yIG1vcmUgZmxleGlhYmxlIGdlbmVyYXRpb24u
DQo+IEFuZCBhbHNvIGhhdmUgc2VwYXJhdGUgaTJjIG1hc3RlciBhbmQgc2xhdmUgcmVnaXN0ZXIg
c2V0IGZvciBjb250cm9sLg0KDQpIZXkgUnlhbiwgdGhhbmtzIGZvciB0aGlzIHdvcmshIFRoaXMg
aXMgYSBsaXR0bGUgYml0IG9mZi10b3BpYywNCmJ1dCBhcmUgeW91IG9yIGFueW9uZSBlbHNlIGF0
IEFzcGVlZCB3b3JraW5nIG9uIGFuIGVxdWl2YWxlbnQgUUVNVQ0KcGF0Y2ggc2VyaWVzPyBXaXRo
b3V0IGl0LCBJIGRvbuKAmXQgdGhpbmsgUUVNVSB3aWxsIHdvcmsgd2l0aCB0aGlzDQpzZXJpZXMg
cmlnaHQ/IEkgdGhpbmsgUUVNVSBvbmx5IHN1cHBvcnRzIHRoZSBvbGQgcmVnaXN0ZXIgc2V0IHJp
Z2h0IG5vdy4NCg0KVGhhbmtzLA0KUGV0ZXINCg0KPiANCj4gdjM6DQo+IC1maXggaTJjIGdsb2Jh
bCBjbG9jayBkaXZpZGUgZGVmYXVsdCB2YWx1ZQ0KPiAtcmVtb3ZlIGkyYyBzbGF2ZSBubyB1c2Vk
IGRldl9kYmcgaW5mby4NCj4gDQo+IHYyOg0KPiAtYWRkIGkyYyBnbG9iYWwgeW1hbCBmaWxlIGNv
bW1pdA0KPiAtcmVuYW1lIGZpbGUgbmFtZSBmcm9tIG5ldyB0byBhc3QyNjAwLg0KPiBhc3BlZWQt
aTJjLW5ldy1nbG9iYWwuYyAtPiBpMmMtYXN0MjYwMC1nbG9iYWwuYw0KPiBhc3BlZWQtaTJjLW5l
dy1nbG9iYWwuaCAtPiBpMmMtYXN0MjYwMC1nbG9iYWwuaA0KPiBpMmMtbmV3LWFzcGVlZC5jIC0+
IGkyYy1hc3QyNjAwLmMNCj4gLXJlbmFtZSBhbGwgZHJpdmVyIGZ1bmN0aW9uIG5hbWUgdG8gYXN0
MjYwMA0KPiANCj4gcnlhbl9jaGVuICgzKToNCj4gIGR0LWJpbmRpbmdzOiBpMmMtYXN0MjYwMDog
QWRkIGJpbmRpbmdzIGZvciBBU1QyNjAwIGkyQyBnbG9iYWwgcmVnaXN0ZXINCj4gICAgY29udHJv
bGxlcg0KPiAgZHQtYmluZGluZ3M6IGkyYy1hc3QyNjAwOiBBZGQgYmluZGluZ3MgZm9yIEFTVDI2
MDAgaTJDIGRyaXZlcg0KPiAgaTJjOmFzcGVlZDpzdXBwb3J0IGFzdDI2MDAgaTJjIG5ldyByZWdp
c3RlciBtb2RlIGRyaXZlcg0KPiANCj4gLi4uL2kyYy9hc3BlZWQsaTJjLWFzdDI2MDAtZ2xvYmFs
LnltYWwgICAgICAgIHwgICA0NCArDQo+IC4uLi9iaW5kaW5ncy9pMmMvYXNwZWVkLGkyYy1hc3Qy
NjAwLnltYWwgICAgICB8ICAgNzggKw0KPiBkcml2ZXJzL2kyYy9idXNzZXMvS2NvbmZpZyAgICAg
ICAgICAgICAgICAgICAgfCAgIDExICsNCj4gZHJpdmVycy9pMmMvYnVzc2VzL01ha2VmaWxlICAg
ICAgICAgICAgICAgICAgIHwgICAgMSArDQo+IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtYXN0MjYw
MC1nbG9iYWwuYyAgICAgICB8ICAgOTQgKw0KPiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzdDI2
MDAtZ2xvYmFsLmggICAgICAgfCAgIDE5ICsNCj4gZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3Qy
NjAwLmMgICAgICAgICAgICAgIHwgMTcwMyArKysrKysrKysrKysrKysrKw0KPiA3IGZpbGVzIGNo
YW5nZWQsIDE5NTAgaW5zZXJ0aW9ucygrKQ0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9hc3BlZWQsaTJjLWFzdDI2MDAtZ2xvYmFsLnlt
YWwNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pMmMvYXNwZWVkLGkyYy1hc3QyNjAwLnltYWwNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtYXN0MjYwMC1nbG9iYWwuYw0KPiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1hc3QyNjAwLWdsb2JhbC5oDQo+IGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWFzdDI2MDAuYw0KPiANCj4gLS0gDQo+IDIuMTcu
MQ0KPiANCj4gDQoNCg==
