Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3915B73628D
	for <lists+openbmc@lfdr.de>; Tue, 20 Jun 2023 06:09:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ami.com header.i=@ami.com header.a=rsa-sha256 header.s=selector1 header.b=Sw/lKJ4p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlY7D5k6vz30Pp
	for <lists+openbmc@lfdr.de>; Tue, 20 Jun 2023 14:09:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ami.com header.i=@ami.com header.a=rsa-sha256 header.s=selector1 header.b=Sw/lKJ4p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=ami.com (client-ip=2a01:111:f400:fe5b::615; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=kennywu@ami.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlW08699Qz2xpq
	for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2023 12:33:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6Hoe1jg8wE6uTJdTUiEkEcWU5gz2ddVn5bDRVSBsL3fhHaNlZAWGoXemTtHFkzegScRi6DKh+IWZuQTLdNAMa3b1NtjuPtejyWrSEW8peyLi4Uy53NP0Rplj+PxRHqjnNj/tKiNWpGoa4yK/c+k1GRtp7F3ZmCC+AfcHj9r28UNmVxcaH1qrU5Z0pSGyf3tJqfGc+nvrcfx0o0liZ7JRqAE5/9wwiYFliLtMB8GU4hqEJJLutYUTf7Qln9kmzVsmHs6kRLc8Hs/fk0lVh4/vMi4YZlsu+PI1B0JQvbnuyZK71I7b/qtlkxVWM0uFNp0OHteoi30hSZI2q4HuT21oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0jO7PxDn5yo5vY0bxC6pW8D9mjcgE/k6hP60DPcXwU=;
 b=JIcTUBAPs70d5ApaDnWpLGFQks+sVnc/gda/5fs2WXO+KEERIayxO7cVFelIUoUH6biSs+cRaS5ZR7oDY18nXAlBrKHg7VWWyvMghhSNqZAzXR6ZVai8jel4X+IGg1ZHUJmZ+AFC1+csi3gE4M1xSMmuOEjhRMjR1zAWh/ZLkqEjP+GSh5+5/3ymZK/diCntnUKEh3XWhOVPltqk7zknYTFNiLpwJ9osjcLRKOGGnrJG0JVWmGGEt8NtS7W8Na33sxYvAywXhiI7a2FgaLBBcPhi2jHytFukyA3F2H+Uk2oRtWAwSFAOrSZwSJnZc7FBBw82wxkP8hbeBcqw6lnO6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ami.com; dmarc=pass action=none header.from=ami.com; dkim=pass
 header.d=ami.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ami.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0jO7PxDn5yo5vY0bxC6pW8D9mjcgE/k6hP60DPcXwU=;
 b=Sw/lKJ4pTDmt3HGwW5So6XEaPf8p3Zp3w8glYJrxCzLQ0KWCcGH5Bnycb9aLY/08Lpm0Bzcu6bUFh84woOE/QOKbmH/fY/5ZxbzAcD0Ln02G2czQ+wA1KJR3p/PbP5M0vOrF+6LDaxIDrdKBwIKl0R4zKjnUQ6rg1ruVq5goy0Q=
Received: from DS7PR10MB4861.namprd10.prod.outlook.com (2603:10b6:5:3a7::15)
 by DM4PR10MB6109.namprd10.prod.outlook.com (2603:10b6:8:b5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Tue, 20 Jun
 2023 02:33:04 +0000
Received: from DS7PR10MB4861.namprd10.prod.outlook.com
 ([fe80::c0b:f972:c3f5:ac2d]) by DS7PR10MB4861.namprd10.prod.outlook.com
 ([fe80::c0b:f972:c3f5:ac2d%6]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 02:33:05 +0000
From: =?big5?B?S2VubnkgV3UgKKdkq9i8ZSk=?= <KennyWu@ami.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: The design of multiple VLAN at OpenBMC
Thread-Topic: The design of multiple VLAN at OpenBMC
Thread-Index: AdmjH4QqnhWQphzKQ5mCi4kq39XmDw==
Date: Tue, 20 Jun 2023 02:33:05 +0000
Message-ID:  <DS7PR10MB486175B1DBCE7437A2F8E980A55CA@DS7PR10MB4861.namprd10.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ami.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR10MB4861:EE_|DM4PR10MB6109:EE_
x-ms-office365-filtering-correlation-id: b0e5ca30-aeff-4304-9f18-08db7136ad3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  WAKnvuW4+Z0/AWqSA04TwQTAa7T7eiXuxOLJQPBu7AElbi8N7Es8tHV2TIsT6vTdrHoUiUvLYICzi4UW+xqxsJdIOJ4uTw2oR49t3wg6Nw2l+j1eNl0JDzxDonE1ALu4wqDIElBp2aNyEnX33pVXBuSL1qyF6kQRzhcI8klU8of+PcdZPezT/uIufe8zRIHCU1dHur8Be3ea9TFiC+gVSBqKw1K5cQ/JYTj3ZjdfvGziZO5w2S3ButPwTVxeJedmHmFsecbUwiX6tfR5SKBWUSHf/OqbVbm2zkoLi6RznmZMngWq6YWkWoAUwngiLQYWfen8ATzdk1mjozQdbf87/ohJKV6TDBs0RAmFnsW1t9QeLvaNkvLM+COrFr0okDDnACQmZcYWFwHL9fTNiQReQ1Tc8PLSJOisk7hY6PK4ytcQrTsHzES7N2t9c7OpnL8xAYab5RrR/2vyg2BElmG4xvttPjhD/n846KzJuWSfEiffp7LKoOh6Njbh3Q39Ctff+FLNzMw8H9nRnII49vZ+6iB0cKKAJhE/2RVD1qgCHyEGSQzVkg37YngCmhJeDECCyzsDxWhRF1cT0jFeybY/08ib1QkBhILpxsEhMFAiw37Dbub916jdvP0hedKltURB
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB4861.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39850400004)(346002)(136003)(366004)(376002)(451199021)(52536014)(4744005)(478600001)(5660300002)(9686003)(6916009)(76116006)(66946007)(4326008)(66556008)(64756008)(66446008)(66476007)(2906002)(316002)(41300700001)(71200400001)(7696005)(8676002)(8936002)(186003)(6506007)(83380400001)(122000001)(55016003)(38100700002)(40140700001)(33656002)(85182001)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?big5?B?aDFLd2k0ei9vRW1SeTI0NGxHRjhQcDRFQU13SjFqZEF3a3E2eHU3V0k2dnZzWlFl?=
 =?big5?B?MWU3RXY1bXc5dGFxcDhQc2Mrc0h1VExRRUZXSVVqUlY1NEplS0oydHFXNDNscXVF?=
 =?big5?B?T0hRQVZhb1NJRS8zM1loK2IrVVhrV1FpYUZ2YjVzSHE0NGVwdENHdEd1cDJRRjVk?=
 =?big5?B?TUVBTWV3TTQ4ajlqVFJQVVBVcisyWGZYSEVVd1ZTRzE4NnRyY0ZDbTU4L0pMMm9P?=
 =?big5?B?UjJIS0ZVUVcxWno1eFIvRWU5RWVaNCtwUkpWSjg3cXdWRFZCSUNqcWtJSmc4NC9x?=
 =?big5?B?M2NZNDN0bUZYL1dHRlJQT1BJM3NuUnVmSjhGUjFOMU9CMlZvMlFZZ2hVM3JndDZh?=
 =?big5?B?a25OVTViNEJEZHdFK1NKcTZqanpzS2E2ZFFVbjdjSi8yclI4b2FDYzFiYnFjZlM2?=
 =?big5?B?RFh4V1dZRDB0dzJ3UDZaR3dYeHJrYkZQTUN0bWFlWGV6WUltWFFIZjh5cDVmb3cv?=
 =?big5?B?NUs4UG9uVmp4SXc4OE1LVG5GZFdOU0JZb3F1U2VOSlBVQjN6TUdmZloxK1ptMXY2?=
 =?big5?B?RHdsaVQ4UWFGRE5RL1pIazE3VmlmQ1pGWlBpQ3dROGxtQ09QVVRZdHhSYngvZzBT?=
 =?big5?B?UnVsS2Z3NjdtaWtKN1RMWHEydStoa1Jhd09kckV4L0o5QnVPTjZualJmUDJ2UkFB?=
 =?big5?B?bFNJU080MWZBUS9zaGRKc2w3SzZQWDJiT1NycXNObzZZcVhiMEgwWE1kWndnV2RT?=
 =?big5?B?SU95NkhrUGcxVUtmaDY0dlMyUW1FVUR0NmV5MWl0SjJzeWRROTYrNExVYVluQlox?=
 =?big5?B?dG5IdEtiRXlGREhxUnU4N0ZXYWdWWjBqUlJNMTUzMzFDb0phMkNlOUgyeU83NXZl?=
 =?big5?B?WEtiUEhmZE9JS0hybVgvUmw1SWsrSVJnTk96d3FpbU44VmtTak9UMEV0VFZVZW9r?=
 =?big5?B?azFkcHhZSlVZUFBEaDgwS0NmVjgweTlkV2kveHdETC9IbWkwalpMOCtjUDcrZTlq?=
 =?big5?B?VFoyN2tud0h2ODY0clJ1Q0dIMHg4MUNUamM2UkhjbU1vOTVsKzRKRnY5aUZxM3g5?=
 =?big5?B?bmtiOTc2enlRY2c1UTEyNWwwTm81ZStGc3lFUUlMRnlKTGNsaXdTdExFR0dsc3dv?=
 =?big5?B?VmZwNWRNSm1XTmdFQTZQMVh4WXlUeGJ6Qjc0NU1DZUMwWElQNUh6elIwQXU0R1JY?=
 =?big5?B?NFE3QkxxM2Q3b2RoOHJSWVEyWlNBd1RiMWpROUpaYk9kL21abnhvWjlKVkRNUE02?=
 =?big5?B?MjJWcENyNVNlWWpoZHRkQS84cjZEMWlMeGF4bGllcDJRcmFDMkE4d2ZUeEljdkNW?=
 =?big5?B?Sk02THJkLzlORlZVTmU5ZGdVWFdrQW5tSlhmMjV3R2dJempTRjJLVUxXcUpQU0RN?=
 =?big5?B?K3p0V1c5TFFCdjBXdVQyRHF5ZEp6clFNbG5TNFpFZmhCOXJrS2ZNSHRwMXBhSlUw?=
 =?big5?B?M2hHc3RlUVJMVW1FSEFWa0NpRUpYQ0hZY01xMVg0TDRmNWk4U2g3QUV0UW96Y2Fj?=
 =?big5?B?YWJJbVZqeXNqR3lraFI1aW1vNEdkcVo2STR5dGxXV21rc0hYRjdMeklhendscWVV?=
 =?big5?B?R3U5ZVgwdGxRYU9wL2h1ZXRuWUt0UWZraUhWYUgwWGZSVE5uN1o4M0tGK3NEazNo?=
 =?big5?B?V25jem1iYzNnWEpvOWRrdi9RdjN3UDVic2FEMUI5NngrN3kyNndaMCswc2lRQlNI?=
 =?big5?B?aEdPakJwYWNaSC9RdEhHVjhnaXBtN2srNFlKUjlYajRRWU5VVEtnMjlkbUhvNHNy?=
 =?big5?B?NG9RMFh2bHlDUnNEWGg3bTFKdWVxUnl1aHNUY3JhNWFTOHlwTnpOUkVNS01sSU1x?=
 =?big5?B?RjBJN2E3dkFpUmlLWkFoV1Y2U3FMVXZMVEc0MzNjcXMvTFIwZjUvMWUwRXFweVVU?=
 =?big5?B?WFNsU1p3ZHhUVW1LRHg4bDNyeStpVC9VV2VLS09ka1NvYzM3VDVDbjFyeTd6SXBz?=
 =?big5?B?NHhaM3REaW5GNWVHT1RSbUNEWHVnU28zOFlIV3lCbFBONmhlUUtQR1AzY1pTV1p0?=
 =?big5?B?bGpVOGErZnoyRW1yOVlkRjlheTV5QT09?=
Content-Type: multipart/alternative;
	boundary="_000_DS7PR10MB486175B1DBCE7437A2F8E980A55CADS7PR10MB4861namp_"
MIME-Version: 1.0
X-OriginatorOrg: ami.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4861.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e5ca30-aeff-4304-9f18-08db7136ad3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2023 02:33:05.1510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 27e97857-e15f-486c-b58e-86c2b3040f93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t7k8963zkBk1zOxs/7vEqlNtQ00T7XcXSilC+rH10lEH55lYsV2Mj/U1u0KvjlG7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6109
X-Mailman-Approved-At: Tue, 20 Jun 2023 14:09:14 +1000
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
Cc: Pravinash Jeyapaul <pravinashj@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DS7PR10MB486175B1DBCE7437A2F8E980A55CADS7PR10MB4861namp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgLA0KDQpXZSBhcmUgZGV2ZWxvcCBPcGVuQk1DIGFuZCBtZWV0IHNvbWUgZGVzaWduIHF1ZXN0
aW9uIG5lZWQgdG8gY29uc3VsdC4gSSB3aWxsIGJlIGFwcHJlY2lhdGUgeW91ciByZXNwb25zZXMu
DQoNClRoZSBWTEFOIGJlaGF2aW9yIGF0IE9wZW5CTUMuIEl0IHN1cHBvcnQgbXVsdGlwbGUgVkxB
Ti4gSXMgdGhlcmUgYXJlIGFueSByZXN0cmljdGVkIG1heGltdW0gbnVtYmVyIGF0IGVhY2ggc2Vy
dmljZSBJUE1JL1dFQi9SZWRmaXNoLiBPciBpdCBpcyBkZWNpZGVkIGJ5IGRldmVsb3Blcj8NCg0K
QXMgSSBrbm93IElQTUkgaXMgb25seSBzZXJ2aWNlIG9uZSBpbnRlcmZhY2UsIFZMQU4gb3Igbm9u
LVZMQU4uIE9uY2UgdXNlciBlbmFibGVkIFZMQU4sIHRoZSBJUE1JIGRhZW1vbiB3aWxsIHJlc3Bv
bmQgYm90aCA/DQoNClRoYW5rcywNCktlbm55V3UNCg0KLVRoZSBpbmZvcm1hdGlvbiBjb250YWlu
ZWQgaW4gdGhpcyBtZXNzYWdlIG1heSBiZSBjb25maWRlbnRpYWwgYW5kIHByb3ByaWV0YXJ5IHRv
IEFtZXJpY2FuIE1lZ2F0cmVuZHMgKEFNSSkuIFRoaXMgY29tbXVuaWNhdGlvbiBpcyBpbnRlbmRl
ZCB0byBiZSByZWFkIG9ubHkgYnkgdGhlIGluZGl2aWR1YWwgb3IgZW50aXR5IHRvIHdob20gaXQg
aXMgYWRkcmVzc2VkIG9yIGJ5IHRoZWlyIGRlc2lnbmVlLiBJZiB0aGUgcmVhZGVyIG9mIHRoaXMg
bWVzc2FnZSBpcyBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgeW91IGFyZSBvbiBub3RpY2Ug
dGhhdCBhbnkgZGlzdHJpYnV0aW9uIG9mIHRoaXMgbWVzc2FnZSwgaW4gYW55IGZvcm0sIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQuIFBsZWFzZSBwcm9tcHRseSBub3RpZnkgdGhlIHNlbmRlciBieSBy
ZXBseSBlLW1haWwgb3IgYnkgdGVsZXBob25lIGF0IDc3MC0yNDYtODYwMCwgYW5kIHRoZW4gZGVs
ZXRlIG9yIGRlc3Ryb3kgYWxsIGNvcGllcyBvZiB0aGUgdHJhbnNtaXNzaW9uLg0K

--_000_DS7PR10MB486175B1DBCE7437A2F8E980A55CADS7PR10MB4861namp_
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
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi , <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We are develop OpenBMC and meet=
 some design question need to consult. I will be appreciate your responses.=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The VLAN behavior at OpenBMC. I=
t support multiple VLAN. Is there are any restricted maximum number at each=
 service IPMI/WEB/Redfish. Or it is decided by developer?<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">As I know IPMI is only service =
one interface, VLAN or non-VLAN. Once user enabled VLAN, the IPMI daemon wi=
ll respond both ?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks, <br>
KennyWu<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
-The information contained in this message may be confidential and propriet=
ary to American Megatrends (AMI). This communication is intended to be read=
 only by the individual or entity to whom it is addressed or by their desig=
nee. If the reader of this message
 is not the intended recipient, you are on notice that any distribution of =
this message, in any form, is strictly prohibited. Please promptly notify t=
he sender by reply e-mail or by telephone at 770-246-8600, and then delete =
or destroy all copies of the transmission.
</body>
</html>

--_000_DS7PR10MB486175B1DBCE7437A2F8E980A55CADS7PR10MB4861namp_--
