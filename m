Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5A46DE0F8
	for <lists+openbmc@lfdr.de>; Tue, 11 Apr 2023 18:29:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwrsH04nVz3bhD
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 02:29:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=ldjUBlGr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com; envelope-from=prvs=046598c3df=nick.hawkins@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=ldjUBlGr;
	dkim-atps=neutral
X-Greylist: delayed 5087 seconds by postgrey-1.36 at boromir; Wed, 12 Apr 2023 02:29:07 AEST
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwrrg46Xnz2ylk
	for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2023 02:29:05 +1000 (AEST)
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33BDmdUm032671;
	Tue, 11 Apr 2023 15:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=jUXl+h37hRN0t6Ha/nk0M4dBQBh8vGURAH9hq4ETwvg=;
 b=ldjUBlGrPp+rQKGGwyPctiV49Z1l7SXsGnEHX0g1sr5FpmuGyYcdycLCs4rYH93SfJbQ
 1O3Pl7d1Wk7JYUSifEucppcseZpgIBlNj15OGi9UKTZmyMGV4pznmtNzIhO8Ie1Dprqx
 SE2mxjoy+hQO2N1cdizhBADyG4kFntLCT1WPDjwRCLzcGDd+swk6dyQ17SqSMb4yXZuM
 OHMkg+qQoS47ZubSr++rmIkh84sAbmxMHIE3ne7fddYQZlZ1uBhvdZz5CWHz1KrEHyb6
 VPWe+wHarPutbCfODIR/QPz0jeWrPvAXLEUp+p6cN6yQ49HGWbeUgs+aMPjHFruPbLeS Kw== 
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3pw88091pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Apr 2023 15:04:04 +0000
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id CBF2B13062;
	Tue, 11 Apr 2023 15:04:03 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 11 Apr 2023 03:03:49 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42
 via Frontend Transport; Tue, 11 Apr 2023 03:03:49 -1200
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 11 Apr 2023 03:03:47 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjSULGQ55G/yKKZfj1jFAG1ne0GDQ289+HK3GWLYiTidmuI0gtcPMLhTtasAPYIQ+lXl4EgUqlSOZ4CNiesuo0yWiWEvj/WYNs9JJPInn543FpXzSkQmiVoQiDCbUgCzmTovdiWqtS2D0knKstPT1Ze5035u0kzAdzNN34+61VfURaMVV/jHUXbFdjl9iA/krjRV9loBqfLYSxUjafIJLxPZBgLyeEO/d4Sv58QZlf9B5nLP5xslwSF8+eVXF2mM/VNVpcgqsdltt3O3SPOAq9N1CuUxrNqKxzB5TQSHoMalHVNvblBlL+yhdhXJ5i5TBjqqrpQij3X8qQjCwXZbkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUXl+h37hRN0t6Ha/nk0M4dBQBh8vGURAH9hq4ETwvg=;
 b=FI7EqII8OoPIrM593TUEtm+uX/SnPY+abZ842Wgeg9oTrK4bDvHtdqDQG+oSIJSFbtj9kGOhUARUf9xTZxst1WsMypGyRAmqOKoqAEXr18QKtcY+ieE4Iv2SXQAjv8UYhxf9v7VixwVpk3qOsFoH2rLqt4qNB9EBRPnXqdflCcNoFNODqR9vmSzBBSN4XJySJwix/+1ueyQVz6IEYLa98N3zvIug1tbEm8ye/XQ769911quJHx+mxk3EwRF2cf903P5xIW21Ky1jhFOl2PTDbUZTtrojgU8+OaLRabjUm4owM8p9wbf+e86QZR/oIMGetE/lVEB80CgvhGDitakN4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::10) by
 SJ0PR84MB1776.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:436::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 15:03:45 +0000
Received: from DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2a07:1ac6:6523:8682]) by DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::2a07:1ac6:6523:8682%6]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 15:03:45 +0000
From: "Hawkins, Nick" <nick.hawkins@hpe.com>
To: Joel Stanley <joel@jms.id.au>, "Verdun, Jean-Marie" <verdun@hpe.com>
Subject: RE: GXP support into OpenBMC kernel
Thread-Topic: GXP support into OpenBMC kernel
Thread-Index: AQHZaAZjdYyBKBBOcUCwAOsKu33JVq8dXgeA//++rwCACHJdAIAArEcA
Date: Tue, 11 Apr 2023 15:03:45 +0000
Message-ID: <DM4PR84MB1927024A45E10D117778C393889A9@DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM>
References: <191F3605-11DF-4870-AB07-B4A31169B3D2@hpe.com>
 <CACPK8Xd2kGxq1sb7DKZ0qXoinYygk6WvPTVqy84kgznGrBPdOA@mail.gmail.com>
 <4044DFC4-7175-4E59-9A99-2EE355FF415D@hpe.com>
 <CACPK8Xdvcs2LTSdqWcEW-Ppp8NEf=xBkgAw8ytF8Vm=AAVENUA@mail.gmail.com>
In-Reply-To: <CACPK8Xdvcs2LTSdqWcEW-Ppp8NEf=xBkgAw8ytF8Vm=AAVENUA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1927:EE_|SJ0PR84MB1776:EE_
x-ms-office365-filtering-correlation-id: 89b6b74e-caef-4d1d-e986-08db3a9df25b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0NkSXJoJjaKL5ykGyVjE1pB/91gmeCfbBpTQqid77HRjQUiJ9Iy6BRXO/nACk2f5qERwrjugHm//o/MIxVbxNsScfFFy7weeyq+7cfgsl0AC1CS4iI/4+rSyQicpiyT7zHlyH0UwS1e6cw8vX/CByiKj1/T6ozrFnSnVnyU37Wtex8tZSaivZm3N7/w3eZolZazcox/t0t63HpMy9cDSxBSvB2DwQYdktv3Jbgc5cJFzKSnkFAOKX1MZzzSpQh9pUYsC7OycgQx+V1PF0Lg5XY50K8Y/1KGULgUyxRicJCLGUVSn5hbqCQ/GK2TjrRMyVfFbzjT9XX+CQRhuzD2MfiKQq4rfovNd1cHhQvgsfnEfudvowtM6D2t1ZllVgwGk551kENjpnIrQBf1SV+FQeZqhFcsMnSWIlVq5m3tBOV0GmG2Mj+84GDkJg1qsHLwvqWMJBiw/des6XOoz3FuHKusmaxhDwEswrJpzwiB8xskkgiNcuCN3Ws38yNp//bqo9HVZhd/oZjNnEhVgIraxA3y1KhEw6Fxp0kROzLS2ix+vt9U19KPd8WmRMxnbrtbshNLKPCuS0wtFTsvlJlEAxvMf31BjJQvr47mF9kOSaHQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(376002)(346002)(396003)(451199021)(55016003)(2906002)(4744005)(8676002)(8936002)(5660300002)(83380400001)(33656002)(52536014)(41300700001)(71200400001)(7696005)(478600001)(66946007)(76116006)(966005)(66476007)(6636002)(316002)(110136005)(66556008)(4326008)(64756008)(66446008)(86362001)(38070700005)(122000001)(9686003)(55236004)(26005)(186003)(6506007)(38100700002)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTBINU1PRnMrNzUxUDIzaTJQYUN5QjJaaXFuS2MrbVBlUWF5akY5NXpmL0lQ?=
 =?utf-8?B?c3lMOU1VbktDb3dUVWpXalpKbmJjK0s1OXV0YjVOaTdTY1o4T1l6MlN3bis1?=
 =?utf-8?B?Zmg1UlJrcTc4emN1N0FOdTV2N1dPenhHV0VSekFxVUhRZmo0azlucFJXUi9T?=
 =?utf-8?B?NkxsdHFTczJMd3B6MisvaDJ0Y0x6MTlsVmRDTGFNYmVrak9MVjhjeHEwY29r?=
 =?utf-8?B?RUpDMFhQVitScDczM1U0VUpDZFF4VnB0bjZjOGgxVmNJZG9oV1IzOUcvZmFH?=
 =?utf-8?B?OXZ4WnNxcG9KanhtMllQdmV0citUSFVST0dRRkw1SWxaaC9KT2xicjRTamhz?=
 =?utf-8?B?MFJ5SGN1V0RlblFUVGg4RXZxREdmbUFJbWRVQUpmR0R2bTBBYXREc3U5a255?=
 =?utf-8?B?TGRmRGtjbk5yYTY4QjBZZlhzTkM4MVB5K2k4Y0RPYmpRci9UYlkvdzJOU2Rx?=
 =?utf-8?B?NGVUWmlBT0l5bmFBSVc3RERJUE5LbUpUUzJIdHg1YjFoQ3ZCMy9CT1hJR25Z?=
 =?utf-8?B?TU1ZS2Zua3kwdzV6YWpKQ1RHdjhCM21ZbmpjT0c5THAydjBiemJ1SEVnNWxt?=
 =?utf-8?B?cmI0aU5CdEtDUVFNNWRLSFc4WS8xMmpkK0xQaStYc0RPODV3cUFoeDlkdGR2?=
 =?utf-8?B?NFRHQk53T2hTRllXbnh1YytYQldsY0J6dmw0aGRTdlpXUkhZMlVZbjZFZkx3?=
 =?utf-8?B?UWFjRnk3R0hQUUIyOWQxcEpzdVZMdU81ek12T2xkK0FRaEdxTUNscXQ5WmI0?=
 =?utf-8?B?dFdjV1prT1ZMS2VHUEwvUG5Tc1FMQUUrVWFPdUllbkNxWXhMMzJBZ0FnbEhv?=
 =?utf-8?B?TnlxUHQ1Y2VkcEZaZjB3WFNISllZNUp0b3AxOU5oYU1HVGVjYXJaYmdhU2RD?=
 =?utf-8?B?TjJaTzZEYUwrUUE3QWIybzhTT3VvMTFmRWZLamRUSVhUT3BNQ2NPM1Nody9v?=
 =?utf-8?B?dG82WENISE1WMXpXS3ozRDJMSkR3OVlxbEFjT3FIYmkzZHFWak45ckxBZzFz?=
 =?utf-8?B?TXN3TW1salBnNnczZ1Q2UzhicUhOWGFZcmpocXVoVWdOdTlGNVVpd1g4d0Nk?=
 =?utf-8?B?WTFpTWpwMDl6eXNieFVOYWk4MENiNThINkE2V3hGTDdUQWVnK1lCeWpVaHN5?=
 =?utf-8?B?MGV2eFNkVnNsYitZMUFOVFkzZ1B3SkFjMHRiaVYxaFB3bktFdzB3UmYrejR5?=
 =?utf-8?B?VUhJdGJOYXJlZG1ZU3p6c0FmR3BjV1JFSU1hcUtHbjNHMTRkWXRTOUwyZnRT?=
 =?utf-8?B?WDV0TzFIRFlLTkFVSmNRYTE0UzVWczU4bkRnODF0NnZ3K25sd0Rua2t6YkRL?=
 =?utf-8?B?RjVIMjZqZkppWENxK3FDRG9nYy9EVENFeFNFbXZTNHQ4SU5WVlZxNzJLMTVq?=
 =?utf-8?B?THRRdlpMaUFNRktRcGlGWjRDeEo4STRJd3RNNHdVT1o0QThId1hDQVNscjk2?=
 =?utf-8?B?ZVhtSWZFMzZ3cE1DeHdFZVBCUm9wdkxuR1pNMnRJTkYraCsra3BraEM4bit1?=
 =?utf-8?B?NjNBREJ3UE8welYxRnc4djNJNkZXR25WdGNKZG9OYjYxYkQvM1Zxb1hnM3ZJ?=
 =?utf-8?B?cjRxSW5SQlo3MGtqcjRpQXNKRStjWkFCVGU0dXNjaXRmS3pPSDFRZVU4dWVJ?=
 =?utf-8?B?dmFJL1ViQ3FNTDBHOUtWbm5jbDBxTk0xTWc1OW1wK2xXK284VGJ3K2RkVUZZ?=
 =?utf-8?B?eEsyWGluTjI0MXlUSGN5V2Rvc3E5ak5jcEprbE1JbXdzVjhTM094YVRVbHJF?=
 =?utf-8?B?TFlIZHpORSt3WWpUeVRaQ0NiWmZmZS9YQ3krVTh1SmhVREhXNU9qemFER0s2?=
 =?utf-8?B?bk85eUNzWmtPbTR6UTNxUjlzSHJUMnVTUlcrNWV3SjNUUktNZlNzWmNVZUxT?=
 =?utf-8?B?NzFWblZEWkxCRlB3ZGExM2M4WklsR2dOUzZ6Qks0WHFnelZJMFdwOCthbTBY?=
 =?utf-8?B?M2tOdUxDR0cxL25GYmdabEE2UWVtOGIrelBYbEVsak9pMlRnWlI3N09iSkhr?=
 =?utf-8?B?cGFXbU9CZEdMc3R2SENKYXRqV3ZZTmh0dkVtczNKRG5tamVYeTVQNG9tL1cz?=
 =?utf-8?B?WC9LK3pSZ01WNVhBNWtVb2dscmNpZk04bmZzalJhQjZ3emZ5czd3QzZ6dGph?=
 =?utf-8?Q?8yhH+VieIfK/XXTJntUA78Vi9?=
Content-Type: text/plain; charset="utf-8"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b6b74e-caef-4d1d-e986-08db3a9df25b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 15:03:45.3421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JKw6fDAsj6325kGdjKGzYiXTXkoVs7XfTRCGst8oA2Xkd7TRkSdHwiTCUNCD+IvRTTrbd8Ho5alGwO5ZpEUQcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1776
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: fwIjzin9eGQTMvuObC9Tm4zHPFLDHD3e
X-Proofpoint-ORIG-GUID: fwIjzin9eGQTMvuObC9Tm4zHPFLDHD3e
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_10,2023-04-11_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=993 clxscore=1011 suspectscore=0 mlxscore=0 impostorscore=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304110137
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQo+IEkndmUgcGlja2VkIGFsbCBvZiB0aGUgR1hQIHBhdGNoZXMgZnJvbSBtYWlubGluZSB0aGF0
IHdlcmUgbWVyZ2VkDQo+IGFmdGVyIDYuMSB0aGF0IEkgY291bGQgZmluZC4gVGFrZSBhIGxvb2sg
aGVyZSwgaWYgaXQgbG9va3Mgb2theSBJJ2xsDQo+IG1lcmdlIHRoZW0gaW50byB0aGUgb3BlbmJt
YyB0cmVlOg0KDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9zaGVua2kvbGludXgvY29tbWl0cy9kZXYt
Ni4xDQoNClJldmlld2VkLWJ5OiBOaWNrIEhhd2tpbnMgPG5pY2suaGF3a2luc0BocGUuY29tPg0K
DQpIaSBKb2VsLA0KDQpUaGlzIGxvb2tzIGdyZWF0ISBUaGFuayB5b3UgZm9yIGRvaW5nIHRoaXMu
DQoNCk9uIGEgc2lkZSBub3RlIGp1c3QgZm9yIHlvdXIgRllJOg0KVGhlcmUgaXMgYSBwbGFubmVk
IHNsaWdodCBtb2RpZmljYXRpb24gdG8gdGhlIGZhbiBkcml2ZXIgdGhhdCBJIHdpbGwgYmUNCnNl
bmRpbmcgdXAgZm9yIHJldmlldyBpbiB1cHN0cmVhbS4gV2Ugd2lsbCBiZSBwdWxsaW5nIGl0cyBh
Y2Nlc3MgdG8NCnRoZSBmbjIgcmVnaXN0ZXJzIGFuZCBtb3ZpbmcgdGhhdCBjaGVjayBpbnRvIEdQ
SU8uIFdlIGFsc28gd2lsbA0KaG9wZWZ1bGx5IGJlIGFkZGluZyBhIHdheSBmb3IgYSBuZXcgR1BJ
TyBkcml2ZXIgdG8gZ3JhYiBmYW4gZGF0YQ0KZnJvbSB0aGUgZmFuIGRyaXZlci4NCg0KLU5pY2sN
Cg==
