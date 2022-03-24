Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E93D14E6A0D
	for <lists+openbmc@lfdr.de>; Thu, 24 Mar 2022 21:55:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPctt62lrz30Dk
	for <lists+openbmc@lfdr.de>; Fri, 25 Mar 2022 07:55:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=P/FNzfDr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=60829ea79f=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=P/FNzfDr; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPctP4NKsz2yyn
 for <openbmc@lists.ozlabs.org>; Fri, 25 Mar 2022 07:55:02 +1100 (AEDT)
Received: from pps.filterd (m0165118.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22OIGhGY025921;
 Thu, 24 Mar 2022 20:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=S1hI87sw6vPBHUs4hCvVOvJKtUgf2gHeFnBB3s7Vtao=;
 b=P/FNzfDrWFoA5/gk3B0Pbnu8ZfvDW+KPMNytRq5dn0s48ogtE2K8SW0SzSmmEDhqXgyb
 B1MT38v85Pu9hHjg8o3Q6MGOgBZGihltvcEe2Hf1kAPB/ZvnQzPZClqhgGzQwSZ1F1qG
 iE9QoY3mYN6qkR7/rySthBt4n2la79MeZLASiu0XjnhY29EPQ2a2ZMEGv6vTBprrIW/V
 dcSHFWSxVpDonpvMNDAWUMxIyseqKuD7qkNKWwmglzJ+b3sCxR9ekrLGwaTxjCyr7NMh
 srdWLNMAcZ5V3qetyYzPSm83outLBW1WD5HxKYW23vrDJJKFne937nF6ICGhmtiUTnB5 DA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3f0q1ft039-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 20:54:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJ8ajOhIgszHD14YczgYz+7jfwS9HgfM3i+w5OmOKLVId2Pt4cZF4Tlda2rFRrV2sH4ZIdsvUihg+FIz+lpv7rkbQCm5U6ClBEdDJV/vlhVVlHNwMcdhYvxfx5I4dZ4VPjQDbINqnNZTO8ZpE6AIO0lrCooiZNhZ+bqe9bFUvIytZzUD3AtwXT16ra1V3bMZ0bleUXZCkKE6vVyoehboyvYgBi1AcpmhadMSpMfhjrk1SvmnIGr21/WUINRzRNM/BkV+V/pPjhFoawntRqzG83JfV2YP+R0Oz1zOdDV3aO4/FBepWV7kOrA7JSjw/qz3UoGYQGc881hyuyA+kgpQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1hI87sw6vPBHUs4hCvVOvJKtUgf2gHeFnBB3s7Vtao=;
 b=WSM5ABEk9e0VpJr3JRHAKEHrXf3hsbl54Oa5gzRt48oc4/r6wXcvAF0oGqGb+7jfAyzNNaFRnHroLwiWYblYfVg50M7B6Zx0owqsq9MczSeT5oByqu6uPJoy9oEnk1ez8FZvMBxWFBLln1xzsH81hTdcUMhE8Nx/4s8KCzGxFUtsNrrcgGnRk4iXsgbwBY/nMEqBni2oera8UCe+V7NlphXiaSTdtgsJemcRelZw/P0LLYNIy0v2y38L0xgbDIX88wMspbFMvfF7dboYcf3W7r5ooKX7BzQZ4JJ1EsJYNOyQ7XEGhCdmScjumMxi9nWWhjp571+e/MxTlQoD2NXquQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by SJ0PR04MB8260.namprd04.prod.outlook.com (2603:10b6:a03:3f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Thu, 24 Mar
 2022 20:54:54 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::42f:1f1b:3a9b:b4a3]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::42f:1f1b:3a9b:b4a3%4]) with mapi id 15.20.5102.019; Thu, 24 Mar 2022
 20:54:54 +0000
From: Zev Weiss <zweiss@equinix.com>
To: =?utf-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/1] ARM: dts: aspeed: add
 Quanta S6Q machine dts
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc 1/1] ARM: dts: aspeed: add
 Quanta S6Q machine dts
Thread-Index: AQHYLRqIGGvL9mrdK0CMjMeL/YZHQqzPKJ4A
Date: Thu, 24 Mar 2022 20:54:54 +0000
Message-ID: <20220324205454.GN5754@packtop>
References: <20220301011135.14066-1-george.hung@quantatw.com>
 <CACPK8XcSkQ0HpAMAh8o_jouVprWrdnTOA0dn07Wkoo-5ZWfMew@mail.gmail.com>
 <HK0PR04MB23394082DE0F46CA8111B1A18F029@HK0PR04MB2339.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB23394082DE0F46CA8111B1A18F029@HK0PR04MB2339.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e38d02e1-4964-42de-4267-08da0dd88c89
x-ms-traffictypediagnostic: SJ0PR04MB8260:EE_
x-microsoft-antispam-prvs: <SJ0PR04MB8260410584592BCF1790AD06C3199@SJ0PR04MB8260.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vvXB5GfQE39UiLntn4O21ucj+pkODIX8sYJ/KvhTYwLias5gIesTqo1E0JamNVPE3VCDTMoq/EyZ29T9ma13TTihlB3SnE0D8ZYwZhEyjFZ/LHBw/mjvWjo2rjlXC8ZyuQE/qyuvu5v+HHzIFIzbM5yJ0AIRrZkkmnPvHDDlSICTxYMPIrVB0tq02zzA9XOK7rhG0/UwaGFCul4QwYXyJPyGxrq/oej3DHVO1J1zQ23VbRhhM78os+McbBIi/bQNld18OdPrj2bSkgRKheZVpuYxA64QkHYeEgjiT8m2KsYfG0UYuimOXMhaHrBNoisqMuDTp1V1a+QSf0vdijz5Ma81gkEDLjMY+C69fc+FhLBLW8I94ZGgu7s6rdUn6F/dvXxxhS5F2pcbpn6/xmG8gxD+NYlgGdgBjJ/NLIdamfsa4xP+YIfdMtZBBzJkDkVbhKjAs3mYp3VNXw3sUNE5hYMbQp0mFjkvGfvBixIzmbcB4Hy5x3UQanFbCLmqxstJa2umUcWk3rIDgjJ5oaTBeqpD/jmA0zJSUe3MX/aexwPmgH6XrihCsAYWd05s2IYITHe063xOnZJjr5pA+L5ic1HVXVMsdp8Ppqb6YWtG0G91djlT5OnVv1m+HkiuOgWkJiCoqKA6l0vCw/6jDwum4M8gBqEDKNStXstikBN/ADddTEXToQzrO6ykkDbpnRskGOS6spGe99yYW1i8OZdNpw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(4326008)(8936002)(122000001)(6506007)(33656002)(6512007)(71200400001)(5660300002)(2906002)(38100700002)(6486002)(66476007)(8676002)(66946007)(64756008)(66446008)(76116006)(66556008)(9686003)(91956017)(86362001)(54906003)(508600001)(33716001)(316002)(26005)(1076003)(6916009)(186003)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTcvRzI0SVdyKzJLNDhNZ2Ria0YzQVNDUUpreTY2bUh1L0ErdjJFam8rS2xk?=
 =?utf-8?B?dFpveXdlTDRURExuZlpYL0tmNG0wTlZJQnExWDJFaDlWaTB2N3lpbHlNUU82?=
 =?utf-8?B?RFVXS21ETjVSS1IxM3Z1MjN3QmlEL2V0cjlBeWUyckd3TFJra0tEOTJmMGk5?=
 =?utf-8?B?NnVEbnhLeGhwNVNndnJpdWtNUjZlUzBKN2Z4bEJjQW1Ea2Q3Q281KzlvTTlj?=
 =?utf-8?B?Z2thSVRLNjY4NGYzQUZHYU8waFVsSnBzRVpRL3BkRmk0Ujk2MGJPZkdPbWhk?=
 =?utf-8?B?dFdrQUVqM1RQaEQ5ZWVFM0Nhb3VuYVh6N0U0RFpVSmVoWGxHVnR1bEZPK1Nt?=
 =?utf-8?B?L1dJRmZKVXZZWjVEYTBmL1VEdTh3dHlHQ2RKZi9rV1RHUTRVdlVtSU13VlJl?=
 =?utf-8?B?b2laVjI3NGdNOU4ybHZ3OUNGditBS1NPWlpYTFE3WENTb2NkdUJzeG82a1py?=
 =?utf-8?B?WFJueU5BN3N0Zzh6eGdZdS9OQUNobFpzb1VCUE85dUxWV1VNYmpaa3FRUzZ4?=
 =?utf-8?B?eGxucGU1d2hzTEswbHphVStJNDg1cmpYMkdQUE5pbUdicHZ5Smt1Y0VTN1M4?=
 =?utf-8?B?V05RaWViZ2czMzMvTmxiZkpaMjVPVTV3eFRTcnMyMGZOVmJqendJV09QTlhR?=
 =?utf-8?B?UUZ2OVFoZ2QyajJab0Njcm0zQkNRZHRsVW04VitHL0lYMkxzOVpqVHBYTHo1?=
 =?utf-8?B?SHAvd3N0dzdocUlSbjZOcEFacjg2YjVXRjVSV0xUVGQvamhQbWQzYWFtalhz?=
 =?utf-8?B?ZEpZWG9rZ2NxVXQzY1dZVGFqdmZXelpBWXdObGJBN1YrN25CSjRXZE1wcUlT?=
 =?utf-8?B?ZlhIRUQ3RFArNHNmMXQ2eUQwU0trbWNhMU5FTTZFTkRNbnVzVFpWTFV0RERN?=
 =?utf-8?B?alBLMFkrdE96YnlDb0YyUEJjaEFZZVFlSFlTejdtNVF3TDFudzNuOERYL09a?=
 =?utf-8?B?Vmx3YXcvdm04RlFOM0VYQlI3ckJIbGdtK3Y0bmdxTmZqaFJPV3l5cEtWbEla?=
 =?utf-8?B?YkVwZ1BhSlpuU2RQMjZUQjJXbjRHaHhxNURHTUFWRktIcTkyTjNqU05qN0dG?=
 =?utf-8?B?eWZVMmltLzRWNlhpNG9CQzVRMTVkbDNwQUNaUHlJcW9qVkFTK1gvZU4xcTVn?=
 =?utf-8?B?UzRFTGd2QVNldE91R0FzVVFacVIxRE5VYnQzYW43VER5eGZkWUU3RnFSam5M?=
 =?utf-8?B?OStlR1lDWnJqbmtLNk0wYXV4NlNCVWg3dWJsaU02RnRtZ2tCYU5LSm5TZ2Ur?=
 =?utf-8?B?KzdPMEJWcjFlN3FIczNXYnBUWWN6c0tTWXJFQU5oaGVmSk5Xb0NGRnVwSmZW?=
 =?utf-8?B?YUlTT0ZmalI5amN2L21RMi9CQVlmUlh5QVRyZmVtUm5pMnNoQ1BaWEgvSi9J?=
 =?utf-8?B?dnI3TEJMTVJOZDdMRDJNUEJRQlNnYzQrV2tuNW4ySEwvR2ovNVIvVVhBazdL?=
 =?utf-8?B?aE1qbFBqWjlybkFDL0Vra09aNFRBUkI0cGllRkZmOXRSUWIzTkd0THFMcGlo?=
 =?utf-8?B?dTBKWmVqYjBmaDVXTld5NWxIQncyOFRhZ21mVlE4QWJBY000YkZFcHVpRHU3?=
 =?utf-8?B?SkJSSm5YQ1BBSTBxMGZ5MUx1UG50RGpXS2hwOFdwVFVUbDVrb1lWV0ZVeDBH?=
 =?utf-8?B?Tno4V0Iwc2JhUkRpNm5KdVJFdlNFRjRERFM0NStOTW5QeXc2YTN0MHh4SUVw?=
 =?utf-8?B?cFVJcGVTWG9QanMvSVJ5aUdNNlBFSnlLMlBnYi9acSs1bGxsQUc5djAxSHlB?=
 =?utf-8?B?NGhORHJjcFZQWGtPaVBOeUJhU1VBZlNPVmdxNjRYSzZRNXB3WGI3K1Z0WUNR?=
 =?utf-8?B?WCtnU1ZrdmtYbVF4anFQb0Y1a0ZoRVdxY0N3SWFMelpmbEtIQWFwNVEzLzQw?=
 =?utf-8?B?eTFaMnNIK2ZscDgrM2FLTEM1RnBHMEJmTmp1cFlDRlhLaDlNOTM3RjYwSXhR?=
 =?utf-8?B?RFcyZFdVRnliRzdraEU2UlhxVW4zTHVTUytoaU9rYk5vcnNxdWc2NVl4dnZo?=
 =?utf-8?B?SmpiSDBKZU93PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <804793F0E1BA3747BF183BD9071CE556@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e38d02e1-4964-42de-4267-08da0dd88c89
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2022 20:54:54.7311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /TrxYySg272I+pj7xairveZEuni8F42XetVZvcyJCUwj6ZSY+6rvzfG4AqaQA1zKEuAh6Dmf52zdwC8HyHW6yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB8260
X-Proofpoint-ORIG-GUID: ioszrV6gMfPKjcc8PCk67dtMAIDGxNgd
X-Proofpoint-GUID: ioszrV6gMfPKjcc8PCk67dtMAIDGxNgd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-24_07,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 clxscore=1011 malwarescore=0 mlxlogscore=698
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203240110
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
Cc: =?utf-8?B?QWxhbiBLdW8gKOmDreaMr+e2rSk=?= <Alan_Kuo@quantatw.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?utf-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>,
 George Hung <ghung.quanta@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gTW9uLCBGZWIgMjgsIDIwMjIgYXQgMDc6MTM6NDRQTSBQU1QsIEdlb3JnZSBIdW5nICjmtKrl
v6DmlawpIHdyb3RlOg0KPj5PbiBUdWUsIDEgTWFyIDIwMjIgYXQgMDE6MjMsIEdlb3JnZSBIdW5n
IDxnaHVuZy5xdWFudGFAZ21haWwuY29tPg0KPj53cm90ZToNCj4+Pg0KPj4+IEFkZCBidWlsZCBz
dXBwb3J0IGZvciBRdWFudGEgUzZRIGJvYXJkIGVxdWlwcGVkIHdpdGgNCj4+PiBBU1QyNjAwIEJN
QyBTb0MNCj4+DQo+PkhpIEdlb3JnZSwNCj4+DQo+PldoaWNoIGNvbmZpZ3VyYXRpb24gKGRlZmNv
bmZpZykgZG8geW91IHJ1biB5b3VyIHN5c3RlbSB3aXRoPw0KPg0KPkhpIEpvZWwsDQo+DQo+V2Ug
dXNlICJldmItYXN0MjYwMGExLXNwbF9kZWZjb25maWciIGZvciBTNlEgc3lzdGVtLg0KPg0KPj4N
Cj4+SG93IGRpZmZlcmVudCBpcyB0aGlzIGNvbmZpZ3VyYXRpb24gZnJvbSBvdGhlciBwbGF0Zm9y
bXMgcHJlc2VudCBpbiB0aGUgdHJlZT8NCj4NCj5Ob3QgbXVjaCBkaWZmZXJlbmNlOg0KPg0KPjEu
IFJHTUlJIGZvciBtYWMyIGFuZCBlbmFibGUgbWRpbzMgZnVuY3Rpb24gcGlucw0KPjIuIHNwaTIg
Zm9yIEJJT1MgZmxhc2gNCj4zLiBtYWMgZGVsYXkgZm9yIG1hYzIvbWFjMyB0byBwcmV2ZW50IG5l
dHdvcmsgYWJub3JtYWwgYWZ0ZXIgQS9DDQo+NC4gSTJDIGJ1c2VzIGVuYWJsZWQgYWNjb3JkaW5n
IHRvIFM2USBwbGF0Zm9ybQ0KPg0KPj4NCj4+SSBhc2sgYXMgSSB3b25kZXIgaWYgd2UgY2FuIGdl
dCBhd2F5IHdpdGggc29tZSBjb21tb24gY29uZmlncyBpbiB1LWJvb3QsDQo+PndpdGhvdXQgcmVx
dWlyaW5nIGV2ZXJ5IHBsYXRmb3JtIGFkZCB0aGVpciBvd24gZHRzLg0KPg0KPkRvZXMgaXQgbWVh
biB5b3UnZCBsaWtlIHRvIGFkZCB0aGUgYWRkaXRpb25hbCBjb21tb24gZHRzIGZvciBBU1QyNjAw
ID8NCg0KQW55IGZ1cnRoZXIgdGhvdWdodHMgZnJvbSBhbnlvbmUgb24gdGhlIGJlc3Qgd2F5IHRv
IGFkZCBzdXBwb3J0IGZvcg0KcGxhdGZvcm1zIGxpa2UgdGhpcz8gIEkndmUgZ290IGEgbG9jYWwg
cGF0Y2ggYWRkaW5nIGEgLmR0cyBmb3IgYW4NCmFzdDI0MDAgc3lzdGVtIHRoYXQgZGlmZmVycyBm
cm9tIGFzdDI0MDAtZXZiLmR0cyBldmVuIGxlc3MgdGhhbiB0aGUNCmFib3ZlIChqdXN0IHN3aXRj
aGluZyB0aGUgY29uc29sZSB0byBhIGRpZmZlcmVudCBVQVJUIGFuZCBtYWtpbmcgYQ0Kc2ltaWxh
ciBwaW5jdHJsIHR3ZWFrIGZvciBSR01JSSBvbiBtYWMxKS4gIEkgd2FzIGFib3V0IHRvIHBvc3Qg
aXQsIGJ1dA0KdGhlbiBzYXcgdGhpcyB0aHJlYWQsIHNvIEkgZmlndXJlZCBJJ2QgaG9sZCBvZmYg
aWYgdGhlcmUncyBsaWtlbHkgdG8gYmUNCmEgS2NvbmZpZy1iYXNlZCB3YXkgb2YgYWNoaWV2aW5n
IHRoYXQgc29vbi4NCg0KDQpUaGFua3MsDQpaZXYNCg==
