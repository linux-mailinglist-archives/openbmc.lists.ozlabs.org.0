Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0544D501CB2
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 22:34:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfWRN0cCPz3bXn
	for <lists+openbmc@lfdr.de>; Fri, 15 Apr 2022 06:34:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=TsTKMkgW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=71032d4e76=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=TsTKMkgW; 
 dkim-atps=neutral
X-Greylist: delayed 1701 seconds by postgrey-1.36 at boromir;
 Fri, 15 Apr 2022 06:34:28 AEST
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfWQr5FHCz2yPj
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2022 06:34:22 +1000 (AEST)
Received: from pps.filterd (m0165120.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 23EJkPPu028251;
 Thu, 14 Apr 2022 20:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=fcJKSI8y8ckbEak/tOzyd3UXJwhGUWBTeMvNJP2TlPk=;
 b=TsTKMkgW5lacncRRWeKL33hQGBdZ3HDRblHMpmgoh8sLRyVLgRoITViiQm4mL94QrrUo
 CE+6GIPbc5W00Pw4QQU0uxrZCxfUES853PkRC7MgLKnv4GuevO/brzI1wOYIbXjRyg7N
 62kZo84CmBN/C1CRG9AFyDUb3ooqMfBDPGdNbLqOOuOzxfoJP+FkIxGznkFUk3DprfYH
 bBb34/1hduTMs1dWayr58fWFjxJiJyaBua8+nZKqDDMek6N77/ErvGFIbTaGc4Biv2vO
 /UXEh6HRhAdJ3Hg2knGs/LrS67wAFLP3NYcMplGyTQIJCMQPY0rnCKwAZwb+5Z8aFk0z pw== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3fersw0dgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 20:05:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5dMfknY0y6KnGQHNFlGcVq2eePfZ0+SmzaAKCJQG0U/SkHnpPmNWqSGpj75QFCA0b5ulvjgZKaa9aBjo7SFKUokUE6QmrK0Jqds0t7WAf1yw9GfiX0NIhRhRiBmsxw2Ox5tlVmIV9qI+P5SAxCQRkqenr3ptD/b0U7urdtWD6zXxUCFcOk9Q1WjMxg7h+2FVRwU43VFfhUf+GPqVtoOU6oYYC31yTxcKonD1a+vOsgydWuugncWek2mmEII5vVWDNaZQT5wfVpaoulzg2Z8rNSKKQKqpTaExcSc8NiJVsxbtn5/uxvjwyGXGihRsl0FqSlZ8+d3diQW0H5XGK42aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcJKSI8y8ckbEak/tOzyd3UXJwhGUWBTeMvNJP2TlPk=;
 b=FB45q8CYDmP7r/b09WPQm8CKNP+C+8SN5wziyCDiU/AL2zfq6owAv9UktV7uZZFQeRR/qbgkQ8R0u35df9IGfTKPJuxdKz8dvuYnrAQAWsFsriia5hdYBM33N1fBf8fXrlxXVx+WJfA4AI4d2H+XtxwkBKBhsoUTSd3FgbY1nPppk/4vSOHTLZg1uekXaZbublXhaQW8eUjzJCDjpBkJPIhGuQKdJjjjUi5Nv9sKCny2nmmOim80P06GE2iHPhVY+aOQNiDR3CQY8OnVL7xbuxHYXT/wtcp4/WAxl/TErEESpXm4jpahEea+f40GpkYGaPadWK58gNCR8W7KqUVeYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by SA2PR04MB7595.namprd04.prod.outlook.com (2603:10b6:806:148::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 20:05:54 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8d01:c5c:c8cd:7c56]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8d01:c5c:c8cd:7c56%4]) with mapi id 15.20.5144.030; Thu, 14 Apr 2022
 20:05:54 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/1] ARM: dts: aspeed: add
 Quanta S6Q machine dts
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc 1/1] ARM: dts: aspeed: add
 Quanta S6Q machine dts
Thread-Index: AQHYUDsMRJSh5UcHLEyo3zZXbRABfA==
Date: Thu, 14 Apr 2022 20:05:54 +0000
Message-ID: <20220414200553.GI24501@packtop>
References: <20220301011135.14066-1-george.hung@quantatw.com>
 <CACPK8XcSkQ0HpAMAh8o_jouVprWrdnTOA0dn07Wkoo-5ZWfMew@mail.gmail.com>
 <HK0PR04MB23394082DE0F46CA8111B1A18F029@HK0PR04MB2339.apcprd04.prod.outlook.com>
 <20220324205454.GN5754@packtop>
 <CACPK8XeGxmVwKznH_9ZDRy7PR6aS787pyxTYo503ry=uJWE+mw@mail.gmail.com>
In-Reply-To: <CACPK8XeGxmVwKznH_9ZDRy7PR6aS787pyxTYo503ry=uJWE+mw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa1bd5c3-7483-4de3-837d-08da1e522e91
x-ms-traffictypediagnostic: SA2PR04MB7595:EE_
x-microsoft-antispam-prvs: <SA2PR04MB759535072C9E7D47DAAB165EC3EF9@SA2PR04MB7595.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R+ugHzcN6qToKwOhmS4eMzZyf9uh+Mdk1keeNZiC+e1BxxInA9Sh/UEFsder0rilrj3PuOJyMtLh6m36nrfouoYiTD1kufdZ+x5Cqc7MW6XFB311F061zaNAUVj0jqe4Yd8RkIWFwgiFY8ip3j18kMvbHk/L0ve9gc2zySxxyeVzQ65J3koYrAUb+W4oc9xP2iJtI12clq0oVNAj5yLYnSnegb9ZmX7mPj4gkDA2DyNgne7Ws9CTNrf80G3Z9hTwGDex7wb620VfIyVSuGK5I5TthCA0J12xdt2GK3UBWWf9XpzBf0s0FTt3i90rwz3hhVch1W1V6+RTrOW8NZMiaDwMgYaWgoHIL1DuHY0ThtiqGQdrTCIk3Li37KpnOksMRDRkQPnGxMLysT9//Jl17wzWSrKxDkwU0IJoKaXmwsmyivYx1P2ElOhvqiMsOdeJuxK+4uMZ4PLy/EeSybECmYJyQ/O+VDKXwHRFUkPYW9iwvLLWahK32TxULWGosAO+nNqi+satiOQVKvRLb9xyb73DZp/iJKwZ8gpw+SF8sMjdmLO6YnvrbdtWyVqnM2oesJ2eS47oecLavbJ476I6Fj9jNVfdldYYLxWWaQLuLAH08FXGaM7RV9DJ/PPpgJRskB+yfLYrREzwXWuzsHLiNiFa0WrQiTYOfnrttMIstmiGuZRnV9dRSf3p0pnXCMbq3UAgxPDb+erW4WSul0UTGA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(366004)(76116006)(6506007)(66476007)(508600001)(4326008)(316002)(9686003)(33716001)(91956017)(64756008)(66556008)(38070700005)(38100700002)(122000001)(86362001)(66946007)(186003)(6512007)(26005)(33656002)(1076003)(2906002)(66446008)(6916009)(8676002)(54906003)(6486002)(71200400001)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eS9yUHU5K2tSQ01BNThpNEx4cDcrMittcTZWQjJlZTFhZ0c5N0RpTTBDZGwv?=
 =?utf-8?B?dE1oS1FRVG9nbkNmN3k0MVJSTlpoSzZpOHAwbkE2OXAxN3g2d2tmbGNobkhr?=
 =?utf-8?B?eXF6SmdpYTlVd0t2MTlBRm9USlJNSU5IL1dMTm5YN1J2UnRPanlQN29Za203?=
 =?utf-8?B?YTFMSUpscEFxRUpFMng0Qm42Q0ZlRm9YcjhrWjZONkdLMjd2SnBpaStHeTFJ?=
 =?utf-8?B?eVA4VFQ3YURGRUhYbFVXRUZheDZXcVBmMUlycDFHZko4ajErT2JCS3FYU1ZY?=
 =?utf-8?B?RE14VjVmN1BPUTRodkFVek02RFdvdGhGMmdlejg3TktreFRsNWRBbHpwTWRY?=
 =?utf-8?B?Z2ZxQlN2NlVUU2tlNVdlN2ZEcm5xdkwrN3RSNzZIRmVZOG5lVmZnRmM4a2RV?=
 =?utf-8?B?TEhMelR0WWxXeTFSUU9QYlFTZEYrYjJJVU52MDM0T0tQazlkeWV6T2RSZGwz?=
 =?utf-8?B?Z3p2M1lkSXZQb3l3cm54VEowTnZkdFZxSTdwM0xGRjBNNG95cWYvbVNwODdk?=
 =?utf-8?B?TzlZUm1Gcm5OdXgrTDUrNzhBOVQzNnUyckZaQVQreldKUWxJVC94SnROd2hF?=
 =?utf-8?B?SDN2TGZGbktIUWk5ZkFjczd6MFB5LzA2aHZTNlRuMDFhSXVoc1dhZDlDWkth?=
 =?utf-8?B?WmM4M1RMY3B2ajFjYUFta2dCbjc3Zk02RVNGNys3YWU1NmNYV3ZPZ3k3czMr?=
 =?utf-8?B?OG94NnNraTFqaUU4YVZzMHU3aGovYkZFWXJuVFRaazI0NGl2ZFlxSVFNdUlI?=
 =?utf-8?B?ZGdDblF4VExTWFdKNDBRSFJRa3FtQVI3cVV5bUtJRW5SejFjajh5Z2Z4MW5H?=
 =?utf-8?B?NHF2a2RIc01Lb2N2N1JFV0FaTTFQQlVrRHRGRXkxYUNZbEdBem1QTlZDSGk3?=
 =?utf-8?B?ekdDM1U4aUpnakdrVnRaazIvQzRvVHZDRGhpc3VDUm1iU2YzNEVRL0J0a3Ar?=
 =?utf-8?B?Y2wyRWdOd1pKUUNwWHcwaXNlNDhRbHVmaDNsMGRHREdNcHhGSm0wQ2VZdEFQ?=
 =?utf-8?B?TWlNc0Z3bTcvZElrOE1RRllKQ21OOGtOUFZXWHZBd2FMWm5Yb0NGajNiQ0RI?=
 =?utf-8?B?VURxVUhiUEhFOHhNVGN4U3lYb1h0ZDFGdTYxSkQxQWtBalBGcnlQN3E0VXNp?=
 =?utf-8?B?bVM2SXdsemZOMVJmckpBZkdTN0xIWVlVTGE1WlhQWEl3dWVFY3cvbE1EQjRi?=
 =?utf-8?B?YkM1RytiWldiaEpBM2pLRnNQSVN1K0NHQVV2RWV1WUdNMzF2KzlSdVIrV3RP?=
 =?utf-8?B?N0liQlN0MERFWGVrY2xzTjdEODhiZGw1ZVZSckdKaDRPMG9yYnVMWEdFTVRi?=
 =?utf-8?B?SVhoZWVTNjZta3RWTXcyT3RETFNyazFtMEhkTFo2T1JJRUdLVk1ienB2Zk9k?=
 =?utf-8?B?WG5sY2QwZGJMNmN5ak45Y3pGdEtOSWpnUjJ6UUFxdFgwQ3YzV3BZaHpHcUw0?=
 =?utf-8?B?bTg4S25kTmZFdlliT3pVUW1QNlBFK1VjM1BTNWh0NnJUUGFjZEI5M1NxQ3hG?=
 =?utf-8?B?NkNSaHVIbHZnbzBHMkhWMXR4c244dkcvM3Q0ZDhuLzROaHdYRzZLcTVJRGdB?=
 =?utf-8?B?Qk9rZk9rMW5BQ3FtMGN6SlJNUVNnUHRYS1dBRU5uZTZ4d1VLeUh6b3VzVUJO?=
 =?utf-8?B?eVpQVDV1NmlwVUpabXljRHpMWFZOeE5JN2dUU2J3bjIvbUtrQldJU25PVmhY?=
 =?utf-8?B?dXlvWDdqak9vUlZzcDBqYWNZSXdNejh1SVJQZnp1VU4wUXBqQUpGaE11NWxN?=
 =?utf-8?B?LzdEaEloNGZSdlRGL2xkekJINEtiM2cwTUg2MnM3ZFRlWWEwRHFGeldMb1I0?=
 =?utf-8?B?TDhzMEV2MEMzNGc0aisxOW5YZ2NJb3NpeU1wTjhjZ2RpOWlWRy9kbTlJTUpl?=
 =?utf-8?B?NHN6S2RiSnNIYU1VSGRTWGczZFkwSzN5WjZicGo1L0pTK256VFlIYlpTdlhX?=
 =?utf-8?B?YnBIT0s4S0ZYaXZuQ2xwSnFHSlhxMW0yK0RlVEdJU3FzdEo3SnRrVDNteHdP?=
 =?utf-8?B?NnZuZWpldy9uV2JZY29zUlJLdi9lUGZyWmtTMXVWL084R2ZtQXFRWklmRkNS?=
 =?utf-8?B?TGZsOU1uVVU2WjBHYUtDVUtSaWc0cUNLZngzV011NUtXMnpxQjZGeXJMcjZy?=
 =?utf-8?B?VC9WZjhrVWVGWUZqc052ZDQyNlByb3o4MVpHVDhqQmxkOGhNdkpzMXRMNXh5?=
 =?utf-8?B?c3I1Skl3RzhqTEo2ZVB5Uk5xTmQxYTI1OWcyT3haR0EvazBSN2hJdmVJYWlJ?=
 =?utf-8?B?SlFxOElaZ2wyQVlvTWRLUVhXbTNuZGZnWUJmRFdyQ3UwS0RNV1hzaTVQVllJ?=
 =?utf-8?B?cGI5WVM3UWdmQTBYanRjNTJBTDkxbGIvNTlFYU9JaWVFY09PeHV0dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94AE7D4B33BDDA4C99AF9B9443D9506A@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1bd5c3-7483-4de3-837d-08da1e522e91
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 20:05:54.3317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K+iK4LOlEzgjkDsImkNDXHHR4ScLIU8fvGNvBIk8v1m2nWVHStgIaUQsxd6nijIgZxT85Ae5vKn5/bAPGenOcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR04MB7595
X-Proofpoint-GUID: 5DloOT-b9dYk5DT2ev1bxM29jRYOtQhN
X-Proofpoint-ORIG-GUID: 5DloOT-b9dYk5DT2ev1bxM29jRYOtQhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-14_05,2022-04-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=818 spamscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204140105
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
 George Hung <ghung.quanta@gmail.com>,
 =?utf-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVGh1LCBBcHIgMTQsIDIwMjIgYXQgMDQ6MTM6NDJBTSBQRFQsIEpvZWwgU3RhbmxleSB3cm90
ZToNCj5PbiBUaHUsIDI0IE1hciAyMDIyIGF0IDIwOjU1LCBaZXYgV2Vpc3MgPHp3ZWlzc0BlcXVp
bml4LmNvbT4gd3JvdGU6DQo+Pg0KPj4gT24gTW9uLCBGZWIgMjgsIDIwMjIgYXQgMDc6MTM6NDRQ
TSBQU1QsIEdlb3JnZSBIdW5nICjmtKrlv6DmlawpIHdyb3RlOg0KPj4gPj5PbiBUdWUsIDEgTWFy
IDIwMjIgYXQgMDE6MjMsIEdlb3JnZSBIdW5nIDxnaHVuZy5xdWFudGFAZ21haWwuY29tPg0KPj4g
Pj53cm90ZToNCj4+ID4+Pg0KPj4gPj4+IEFkZCBidWlsZCBzdXBwb3J0IGZvciBRdWFudGEgUzZR
IGJvYXJkIGVxdWlwcGVkIHdpdGgNCj4+ID4+PiBBU1QyNjAwIEJNQyBTb0MNCj4+ID4+DQo+PiA+
PkhpIEdlb3JnZSwNCj4+ID4+DQo+PiA+PldoaWNoIGNvbmZpZ3VyYXRpb24gKGRlZmNvbmZpZykg
ZG8geW91IHJ1biB5b3VyIHN5c3RlbSB3aXRoPw0KPj4gPg0KPj4gPkhpIEpvZWwsDQo+PiA+DQo+
PiA+V2UgdXNlICJldmItYXN0MjYwMGExLXNwbF9kZWZjb25maWciIGZvciBTNlEgc3lzdGVtLg0K
Pj4gPg0KPj4gPj4NCj4+ID4+SG93IGRpZmZlcmVudCBpcyB0aGlzIGNvbmZpZ3VyYXRpb24gZnJv
bSBvdGhlciBwbGF0Zm9ybXMgcHJlc2VudCBpbiB0aGUgdHJlZT8NCj4+ID4NCj4+ID5Ob3QgbXVj
aCBkaWZmZXJlbmNlOg0KPj4gPg0KPj4gPjEuIFJHTUlJIGZvciBtYWMyIGFuZCBlbmFibGUgbWRp
bzMgZnVuY3Rpb24gcGlucw0KPj4gPjIuIHNwaTIgZm9yIEJJT1MgZmxhc2gNCj4+ID4zLiBtYWMg
ZGVsYXkgZm9yIG1hYzIvbWFjMyB0byBwcmV2ZW50IG5ldHdvcmsgYWJub3JtYWwgYWZ0ZXIgQS9D
DQo+PiA+NC4gSTJDIGJ1c2VzIGVuYWJsZWQgYWNjb3JkaW5nIHRvIFM2USBwbGF0Zm9ybQ0KPg0K
PkkndmUgbWVyZ2VkIHlvdXIgcGF0Y2guIFNvcnJ5IGZvciB0aGUgZGVsYXkuDQo+DQo+PiA+DQo+
PiA+Pg0KPj4gPj5JIGFzayBhcyBJIHdvbmRlciBpZiB3ZSBjYW4gZ2V0IGF3YXkgd2l0aCBzb21l
IGNvbW1vbiBjb25maWdzIGluIHUtYm9vdCwNCj4+ID4+d2l0aG91dCByZXF1aXJpbmcgZXZlcnkg
cGxhdGZvcm0gYWRkIHRoZWlyIG93biBkdHMuDQo+PiA+DQo+PiA+RG9lcyBpdCBtZWFuIHlvdSdk
IGxpa2UgdG8gYWRkIHRoZSBhZGRpdGlvbmFsIGNvbW1vbiBkdHMgZm9yIEFTVDI2MDAgPw0KPj4N
Cj4+IEFueSBmdXJ0aGVyIHRob3VnaHRzIGZyb20gYW55b25lIG9uIHRoZSBiZXN0IHdheSB0byBh
ZGQgc3VwcG9ydCBmb3INCj4+IHBsYXRmb3JtcyBsaWtlIHRoaXM/ICBJJ3ZlIGdvdCBhIGxvY2Fs
IHBhdGNoIGFkZGluZyBhIC5kdHMgZm9yIGFuDQo+PiBhc3QyNDAwIHN5c3RlbSB0aGF0IGRpZmZl
cnMgZnJvbSBhc3QyNDAwLWV2Yi5kdHMgZXZlbiBsZXNzIHRoYW4gdGhlDQo+PiBhYm92ZSAoanVz
dCBzd2l0Y2hpbmcgdGhlIGNvbnNvbGUgdG8gYSBkaWZmZXJlbnQgVUFSVCBhbmQgbWFraW5nIGEN
Cj4+IHNpbWlsYXIgcGluY3RybCB0d2VhayBmb3IgUkdNSUkgb24gbWFjMSkuICBJIHdhcyBhYm91
dCB0byBwb3N0IGl0LCBidXQNCj4+IHRoZW4gc2F3IHRoaXMgdGhyZWFkLCBzbyBJIGZpZ3VyZWQg
SSdkIGhvbGQgb2ZmIGlmIHRoZXJlJ3MgbGlrZWx5IHRvIGJlDQo+PiBhIEtjb25maWctYmFzZWQg
d2F5IG9mIGFjaGlldmluZyB0aGF0IHNvb24uDQo+DQo+SSBkb24ndCB0aGluayB0aGVyZSdzIGEg
Z29vZCB3YXkgdG8gc29sdmUgdGhpcyBpZiB0aGUgbWFjaGluZSBuZWVkcw0KPmRpZmZlcmVudCBv
cHRpb25zLg0KPg0KPk9uZSB3YXkgdG8gcmVkdWNlIHRoZSBtYWludGVuYW5jZSBidXJkZW4gd291
bGQgYmUgdG8gaW5jbHVkZSB0aGUgZXZiDQo+ZHRzIGluIHlvdXIgZHRzLCBhbmQgbWFrZSB0aGUg
cmVxdWlyZWQgbW9kaWZpY2F0aW9ucy4NCj4NCg0KQWxyaWdodCAtLSB5ZWFoLCB0aGF0J3MgdGhl
IGFwcHJvYWNoIEkgaGFkIHRha2VuLCBzbyBpdCBkaWRuJ3Qgc2VlbSB0b28NCnRlcnJpYmxlLCBq
dXN0IHdhc24ndCBzdXJlIGlmIHdlIHdlcmUgdHJ5aW5nIHRvIGF2b2lkIGFkZGluZyBtb3JlDQpw
ZXItYm9hcmQgZGV2aWNldHJlZXMgZW50aXJlbHkuICBJJ2xsIHBvc3QgaXQgc2hvcnRseS4NCg0K
DQpUaGFua3MsDQpaZXYNCg==
