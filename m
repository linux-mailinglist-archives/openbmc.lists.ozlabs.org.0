Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5144B6E7658
	for <lists+openbmc@lfdr.de>; Wed, 19 Apr 2023 11:33:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1bFS0G87z3fQW
	for <lists+openbmc@lfdr.de>; Wed, 19 Apr 2023 19:33:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=TZ9tvUVj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tcs.com (client-ip=121.242.48.116; helo=inblrg02.tcs.com; envelope-from=prvs=466d765e6=sandeep.pkumar@tcs.com; receiver=<UNKNOWN>)
Received: from inblrg02.tcs.com (inblrg02.tcs.com [121.242.48.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1bDk55Bbz3cNM
	for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2023 19:32:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tcs.com; i=@tcs.com; q=dns/txt; s=default2048;
  t=1681896775; x=1713432775;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version:content-transfer-encoding;
  bh=0DvpmE3t2Ta6sCJIWCnukUiy64CmoL+SfHIdpuMeHnI=;
  b=TZ9tvUVjNHVXaFthPjXP6BMO86VOHaXEfhwWbzAtSZFKJucMcnhhORqT
   M4xB0wRKFGD/oCIx1Te4M20gJBt6qScp6jfdwJCkSS4BDq8PD1PBh4m8S
   c+SJj1LYTfCk9z54HwXfmVn+AsgOMG0OWH1hesTXGtE/EwuqP9472gJiq
   j/cUhyOEn8HvuZttzK1x/XmzfYRCUXObmxEeMxTV0G2we9yDMGLYpLmR/
   ZBbOMsyyCnVa47l04XtGZhPQ2zPJI7P3d4dlV5itWoCUav77U2Bq7sz8f
   AeIR6Diakkt6y1wAuT4hgr9tY1d+2yI9i4YnbQKPOo/pgbiX1GM0VJ4OV
   w==;
X-IronPort-AV: E=Sophos;i="5.99,208,1677522600"; 
   d="scan'208";a="217826876"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXJhgdaoAZEvXvmIJWFIkbmO94+Fh0Jbzq4e69lIY6R7kPbV/JHsC8aofkb4F3JiwHA355IJcS0z4lpVfpf3KYETMzkoIAy7GHjW4AbUjzkJhHOsuNTXF+TOT/FtN3Hb6WQVDVd0hdJx6kzyM21FzYmvBCgfYI8tOGTZJzLq430q8y58VYD23HVh4R0OwJbS8G3MuZJIcrD8k1vcio44pE/UyV2I7BeYxid5eI09+X2XUyjuB8ys5/PA9ht8KH/gYZDzEgMJhMVNmL+gvQ9Tag6CCvRx1tcPEfueU2FHPk00ZPtcVKLjbwExSoW/5euA34vxMXZz381p52AYPgShFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXekr6gaSDWKwiWD7vONWHvMgYwqt9A2YlhAHaZAl4w=;
 b=JtYsDOw/uB0Bn4nyFGj1fKd9JW3nLqVIBazAl8HbjJiWJzVeCEMhNRNiD6kSry7w52bN7nE8M42mT12i3MpuZIQz4EFS0qQGIGlmcitgOTpUoYlLHl+iLiOGa6zr4OXeZRlAJ8oMH9BQPA9eVbDfrB+dXNudIpio3xl+g+aqTtmXbWX7hxiV4r4Q64tH/MowkMRB8YEUFqd7XKwMZnMOWDjB/RD2Rwm2P9nQBI/tiOKWPUDDrcexPfE4sWSeR8XnjI44rdf7wG42b4ivz5kx5/TLBs8G1/FnzqXxuxEOOU3cFYI4LUoRPZCaCx0izO4UsavyIpc7wLvDK1OhV3PFcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tcs.com; dmarc=pass action=none header.from=tcs.com; dkim=pass
 header.d=tcs.com; arc=none
From: Sandeep Kumar <sandeep.pkumar@tcs.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Ninad Palsule
	<ninad@linux.ibm.com>, Joel Stanley <jms@jms.id.au>, Andrew Jeffery
	<andrew@aj.id.au>
Subject: RE: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
Thread-Topic: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
Thread-Index: AdlnvJ+n/GpqnOWCTXuloOzDKwOlRwACYiMAAU26xTAAFQ2ZAAEd3S7QADT/RYAAAPBKYA==
Date: Wed, 19 Apr 2023 09:29:49 +0000
Message-ID: <MA1PR01MB4129E3F1719B297B56DC148A87629@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
References: <MA1PR01MB412922EF629403C84674A6AD87909@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <8e23c99e-0e62-3866-ce61-c75a14453a37@kaod.org>
 <MA1PR01MB4129EB6FA57EA28AA9002E9C879B9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <2231ac88-3005-0fb4-6aad-e7652ffd3467@kaod.org>
 <MA1PR01MB41297891E40E6E5652661662879D9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <9c136acf-ea18-130b-41bb-5001b01ee8cf@kaod.org>
In-Reply-To: <9c136acf-ea18-130b-41bb-5001b01ee8cf@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ActionId=ceaae429-31d2-4026-84f8-52abf864519e;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ContentBits=0;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Enabled=true;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Method=Standard;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Name=IRM_test_300622002_ul;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SetDate=2023-04-19T09:22:39Z;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SiteId=404b1967-6507-45ab-8a6d-7374a3f478be;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tcs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA1PR01MB4129:EE_|PNYPR01MB8304:EE_
x-ms-office365-filtering-correlation-id: d12c2489-9c12-4d3a-082a-08db40b89f9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XYVBd/OzvKjyCXlvto3GY3v34J3vCnbC0QhZKWRXlxN9dafn+/jQy82nWU87++eczuTT/Qi2J+ACIUc1lDEA+txmpgQAazjf1N+CnSpfTKAeMn/djoDZljNan8o0QrgfZlSS7rHdFkQr6Ve5nUTbpZ3gABqNieitVrabfSree/zMBJ7dEFfa2WgFArmAZzRSTax2lsffcoemeOp3jdrcJChIRzivF7I2BU++0pP/iY6jsQPp5iPhYZ06FVSdzd9BD1xvNRQGTvOKRZEZCP4q5mOFdAeEHg/mk3VXuZt1iNd0lDxudvRyF50sHgeiI2gHT93p9ScTIalMqEsYCC5fi0yzZSD6b2zMRuB0GP+383CSnmaln3xFdYkN8Q+vQmubhsSOTQ0WEM0XCPm5qHslKNbfZ8LtJfcmPXDDFJLNfJwKA+zPObvnPBx1Q8uD2hAj44jbYlpmhP17vHg8Ec09uDvGV3zx9uaHiowjGOTraci9wAGckLSqoNG1H4xPp+A9Vsta7UON5m3cK0mNULTpGOQlOZM2c89C8jhIWo7w4xJCgm4nfmNbkv8rXZIXLTV/esQ1FtI/TxY3wWm2rBzHS7BWBdtlA8S9LugY7nABmLgoyiISmY9BcJdnHMzsIFeo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199021)(33656002)(66574015)(55016003)(83380400001)(52536014)(5660300002)(38100700002)(53546011)(8936002)(8676002)(38070700005)(2906002)(478600001)(7696005)(71200400001)(9686003)(26005)(6506007)(122000001)(41300700001)(82960400001)(110136005)(66946007)(66446008)(66556008)(66476007)(64756008)(76116006)(86362001)(316002)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGxSd05aT2w3NEwwMWkzMURtQzFCZGdiTnl1dVNVdDZVSDlac2wrRjVNOCtQ?=
 =?utf-8?B?Y0wrdHVQU3Juem44cnpEVmgwZHVwTERmV0JxaGtieG54cmdYRGVycDVqd1FX?=
 =?utf-8?B?cjVkdHpkbFQ5OVRtWVd0eEc2Ui9aKzVDRFprbS9VSUdDVFpGVUgwVTVaRjJL?=
 =?utf-8?B?djFjb2ZNdm43M25GSWsrSkJCM2pzNkF6cVBEVGw4UzZKY1BWMWdEeUxPVzdz?=
 =?utf-8?B?cXFhOVBlNHpKcEduUmt1TTRuSURrVzRIK0xhNHpMWUJSZ1N3OUQzME8zRkk3?=
 =?utf-8?B?RDF1bzZNc0lBZzVWL0R0d2R2U3ladVV0bkZ4ZkMxRVBOYWM0RzVjSHVXWC9C?=
 =?utf-8?B?RVdoME1xcW5lcThjV3M5M3hTaTludHZVNmFYSFk4MHN4RmR0SU8vaEE4WXIw?=
 =?utf-8?B?bXA1S01qSEc4UjRZVlp4YzQzOW1obzliVEpWQldCV3phenR2bFZtZjRJTmF3?=
 =?utf-8?B?YXJiR2J5aENwaTBucHdjOGpWWVYrOXJReXVGVGtlY3BKOThJL01DUmI2R0dq?=
 =?utf-8?B?VXJLVW1INW5XUURQM3crcUVSdW1PeDlMcWl4R09weVk0cU1DZmk2eVRHWlZq?=
 =?utf-8?B?VEltYkV0Y3JTRHUzTi9Vc1NXcTV3cGNsRFRBRWFIdDZvTTZnRkdDTUZoZnpU?=
 =?utf-8?B?QjVzbGs0bEhBRUtQYjBxODJsYVFEY0hWSHlJTGwyaFNlVmY2V2djQ0lQR1dE?=
 =?utf-8?B?TTlhYjBXNDhhVTlEVDFPellld3JZdGV3d2xFY2U2aUhBWHFUOUtkN1U5NVN2?=
 =?utf-8?B?MTIxbHBVR1cyRDUrSTVpR2Q2K3oyYTZWWUlDbHN1U2FjQ2FNckRWMmxoU0pj?=
 =?utf-8?B?QmpNMlIyaFdPYW50Q21mMitucFpHdnd1YUVkTGNuUENsMGdKaGlpb2o2dS9t?=
 =?utf-8?B?a3B6b0hBME1qcml2WGNLMUN0QVVsVm42djdPZ0pyaHNYZWM4OXAzRXhhZGt3?=
 =?utf-8?B?bDdEblZoTnZzNUxla1NqcHlrSWlyakY4RnMvQWJMclBDZm1SYndHblR4Lzhp?=
 =?utf-8?B?WDl6dWcyT0ZjSEFhcFRETlREZEFBa0FJUTQ1d2pKRDhrbDJveGI3eTJ1ekk3?=
 =?utf-8?B?K0oyODExODRCOXphbkJwKy8rckNvL2tZSjU5VWN6TzhlOUlMby9wclA5RWxM?=
 =?utf-8?B?dkpjMWJNdXRSd2tUTHlHMjF3ZE91TUpLRlhGUTZGc3lKMEpjdTQ1U1pwVW80?=
 =?utf-8?B?QXBxamhwMUVSSEs2V1pjZUFpN29XMis5RlpteStEVjc1OThSbUhsMnk4NXN5?=
 =?utf-8?B?SUJZVk5kSFErdWNnOUVqSG9ORk8vcTRXT2ZTcW1YZjlTdlEycC9UcXN0b0Js?=
 =?utf-8?B?VmxWMlRLMUxHOGxDbWpKakFOSzZtVmpNQVZwWDFSeXVCeE5aTDM5Y1h3ek90?=
 =?utf-8?B?S1NXU0ozQ0ZjRzVPV01ZR05BckVsVmdJZUdUbHFZWllabFZwVXBTeWJPTTIy?=
 =?utf-8?B?TW5BOEFJUG5Tb3U2WVBkWHVpVmJqclhOSHZIamQ5SGFUbU9oOHdmMU5NbHk5?=
 =?utf-8?B?M0pyNFR5WkJFOXJ5SWVpU1hmTmVsVUx1Q2dPNFcvaWxveUoxcE5KZGFSSjhG?=
 =?utf-8?B?TmpVYWxidTgvamc1ckZRdVdBNG94YlZJYWUvWjNqRW0xN1RHZWVSS1NIaVV1?=
 =?utf-8?B?TTQ2WmlsT0ZrdGJNYS9ySGdhYU9IRUJnWDN4bEpXT3VMcG9Uc1VJR1NhTW9m?=
 =?utf-8?B?d1RGL0d1OU83RkNTejhRNXhlWENmWkhrYnJ6WU5sdWFkdEo3VktjMVc5UXpP?=
 =?utf-8?B?ekpyaTJaYkNWNE1qNFQyVVdqNGtKR3JVdE52UUwzUmpBS0hFckRjWTBkMzhC?=
 =?utf-8?B?Z0NOem43R1BYdkxLVW05TEFNaFZ0VVJPY0V6amp5T1dRZTlqVFhPMDRWUXhB?=
 =?utf-8?B?ZytHNktFN1pwcm1rSkQ4M3pUWE94T2plcmpPcjZ5LzQzak4rZDhkM0RyWGZK?=
 =?utf-8?B?bzFBc25Vbm4yTmQ3UXBKQWFzZEU1VnVCaFlCM3E1VFo4RUpibDFYVDIrVWtj?=
 =?utf-8?B?QTF5WXV6c3ltdjVFV3ZtRmtrd1h6SmJqUjM0OTBrQnFtbEpHakxjeWx2NC9W?=
 =?utf-8?B?WVhBZTlqOW1OaDRpSWtuYXdHSXk5VHNpbGlPNHg4MUJrekFqWTQwWGc2RDcx?=
 =?utf-8?Q?9H3Y=3D?=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: pbdQeHn3BHgsj5b4fcbMOIrCjEnJ13myQHgY9CBusdpHY+2tPBMpVmp7aL7rqGjyP4f16NkvkMy+ulo1S8zvFc0mAi6NslsQMLBlihXWH21nxB8jCoS8QYAmMw0UxoPz9GIbgrSQ03CwaYVV5y8XxlPW3rozD8wGRCyoWNLM6DOZwphshDl5jhF92apB0WmdLP1EDd230UFtIrT2TloSiefLcS37hv8yVRpjvGui3hr787yzCqpw5h0A3KhS2vAFkXpYa4eEB+p8j9R8OXUUUVCKLnDRWuVBGmmy9yPXT7B1BmYg9ZNi8xm12mXTw/WhRPHvv36qPLuwqeSUQfLkZrtvCJqHsR6gVePIZXdGijbtLQkuZld+7G206uNvNiHdLowl4BZIXE/O4yyv6qAC7PubXk4aNPK9nT4fbI2QKg4tSQhByxCgqenOxQan2eeyujXe79RFxkdeTh5blaVej+jM90XMfQKpm/FbkAOP4HlkMwCkKJsDcv20hoqB/i/h+CkoNnh6QiBKVTmoF92EyjAIuxRdQ4e3sVdZWyGgGHRoFehnf74a3AZDTkIO6q03UWMTpM2GnjgmVWp5AvnzqaxbBJ2ARzJmUccDZDMbOWplbfvRLXP9dIpdCAETrbdR91g9fupinjhzeIHdgcKk2me2h7nSzfECmJ61v6iSljwqskNJiUTD/SXmA5N0+n3HXdnlFjIkttwDqK8XI98WLHOsJalx+UZP5hFoPNWS2HdkK6ouhwor+z4AB9fYgAZT94LVpg7PqIQVlnQ8Rzm3PAHhLKbE7N/eWBR2ONc4DDqr7hm0WjLJNXPL7a74ackrXscDFIeCdSEbVLLyBk4ZnPBZg6ihyP61Jq/P9akmWa8L9mzNRcDg08i3l3I8pifA
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d12c2489-9c12-4d3a-082a-08db40b89f9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 09:29:49.9108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 404b1967-6507-45ab-8a6d-7374a3f478be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4pt8HIsQrtJuGL1vlLa7mzFhzLC+Ni/LnDgb+6oEKaRjsSew7Ns/m8qgTgPI9mCQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYPR01MB8304
X-TM-AS-Product-Ver: SMEX-14.0.0.3092-9.0.1002-27574.007
X-TM-AS-Result: No-10--20.223100-8.000000
X-TMASE-MatchedRID: 8+bhjh9TQnHAIiGVQCd+FnzmmMD/HXF+yHdfpwipSH4utoY2UtFqGDUI
	B+o1FDuDNwUXLoow3O87blYJVFl875HetQtcLOdvrmLeMrcoM6gL8TGleseLPN7p0Ru8jKvFRtc
	2qGBany7hIjjnoJEBw+dltIwCeZ1EO5LKPA/ITAUqIkSpQVZGCDVPM/rRSR0dlA5gGtckIoDeYU
	dm+K8oKFIt3twV1phfnei7/aiPMB8ZacyNtZOr0TzHAJTgtKqw3hng3KTHeTZCdYTAgut6WEIjI
	p4EpSqC5m0fZ4ee7AxLvqEMeRJnH7u1XV9filGzGYJhRh6sset9LQinZ4QefKU8D0b0qFy9suf7
	RWbvUtww5jKeVBgYbwtuKBGekqUpIG4YlbCDECtruV6hT84yE/IxdJB3PGL0
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--20.223100-8.000000
X-TMASE-Version: SMEX-14.0.0.3092-9.0.1002-27574.007
X-TM-SNTS-SMTP: F675482DFC5EA45F492D8E94C5AC9D0B5B13FC17FCD148D4258C478A961E15BA2000:8
X-OriginatorOrg: TCS.COM
Content-Transfer-Encoding: base64
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

IFRDUyBDb25maWRlbnRpYWwNCg0KSGkgQywNCg0KR290IGl0IHdvcmtpbmcuIExvb2tzIGxpa2Ug
c2xpcnAgaXMgbm8gbG9uZ2VyIHN1cHBvcnRlZCBvbiB1Ym51dHUgMTguMDQuIGhhdmUgdXBncmFk
ZWQgdG8gYSBuZXdlciB2ZXJzaW9uICBhbmQgaXMgd29ya2luZyBub3cuDQoNClRoYW5rcywNClNh
bmRlZXAuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBDw6lkcmljIExlIEdv
YXRlciA8Y2xnQGthb2Qub3JnPg0KU2VudDogV2VkbmVzZGF5LCBBcHJpbCAxOSwgMjAyMyAyOjI2
IFBNDQpUbzogU2FuZGVlcCBLdW1hciA8c2FuZGVlcC5wa3VtYXJAdGNzLmNvbT47IG9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZzsgTmluYWQgUGFsc3VsZSA8bmluYWRAbGludXguaWJtLmNvbT47IEpv
ZWwgU3RhbmxleSA8am1zQGptcy5pZC5hdT47IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQu
YXU+DQpTdWJqZWN0OiBSZTogSW50ZWdyYXRpbmcgc3d0cG0oYXMgYSBzb2Z0d2FyZSBUUE0pIHdp
dGggT3BlbkJNQyBvbiBRZW11DQoNCiJFeHRlcm5hbCBlbWFpbC4gT3BlbiB3aXRoIENhdXRpb24i
DQoNCkhlbGxvIFNhbmRlZXANCg0KT24gNC8xOC8yMyAwOTo0NSwgU2FuZGVlcCBLdW1hciB3cm90
ZToNCj4gVENTIENvbmZpZGVudGlhbA0KPg0KPiBIaSBDLA0KPiBCdWlsdCB0aGUgcWVtdSBmcm9t
IHlvdXIgYnJhbmNoLiBGZXcgaXNzdWVzLCAqJCAuL3FlbXUtc3lzdGVtLWFybSAtbQ0KPiAyNTYg
LU0gcm9tdWx1cy1ibWMgLW5vZ3JhcGhpYyAtZHJpdmUNCj4gZmlsZT0uL29ibWMtcGhvc3Bob3It
aW1hZ2Utcm9tdWx1cy5zdGF0aWMubXRkLGZvcm1hdD1yYXcsaWY9bXRkIC1uZXQNCj4gbmljIC1u
ZXQNCj4gdXNlcixob3N0ZndkPToxMjcuMC4wLjE6MjIyMi06MjIsaG9zdGZ3ZD06MTI3LjAuMC4x
OjQ0NDMtOjQ0Myxob3N0ZndkPQ0KPiB0Y3A6MTI3LjAuMC4xOjg4ODAtOjgwLGhvc3Rmd2Q9dGNw
OjEyNy4wLjAuMToyMjAwLToyMjAwLGhvc3Rmd2Q9dWRwOjEyDQo+IDcuMC4wLjE6NjYyMy06NjIz
LGhvc3Rmd2Q9dWRwOjEyNy4wLjAuMTo2NjY0LTo2NjQsaG9zdG5hbWU9cWVtdSoNCj4gKnFlbXUt
c3lzdGVtLWFybTogLW5ldA0KPiB1c2VyLGhvc3Rmd2Q9OjEyNy4wLjAuMToyMjIyLToyMixob3N0
ZndkPToxMjcuMC4wLjE6NDQ0My06NDQzLGhvc3Rmd2Q9DQo+IHRjcDoxMjcuMC4wLjE6ODg4MC06
ODAsaG9zdGZ3ZD10Y3A6MTI3LjAuMC4xOjIyMDAtOjIyMDAsaG9zdGZ3ZD11ZHA6MTINCj4gNy4w
LjAuMTo2NjIzLTo2MjMsaG9zdGZ3ZD11ZHA6MTI3LjAuMC4xOjY2NjQtOjY2NCxob3N0bmFtZT1x
ZW11Og0KPiBuZXR3b3JrIGJhY2tlbmQgJ3VzZXInIGlzIG5vdCBjb21waWxlZCBpbnRvIHRoaXMg
YmluYXJ5KiBJIGRpZG7igJl0DQo+IGVuYWJsZSB0aGUgc2xpcnAgcGFja2FnZSBJIGd1ZXNzLiBT
byBlbmFibGVkIGl0IHdoaWxlIHJ1bm5pbmcNCj4gY29uZmlndXJlLCAqJCAuLi9jb25maWd1cmUg
LS1lbmFibGUtc2xpcnAqDQo+ICouLi4uLi4uLioNCj4gKlJ1bi10aW1lIGRlcGVuZGVuY3kgc2xp
cnAgZm91bmQ6IE5PICh0cmllZCBwa2djb25maWcpKg0KPiAqLi4vbWVzb24uYnVpbGQ6NjgxOjI6
IEVSUk9SOiBEZXBlbmRlbmN5ICJzbGlycCIgbm90IGZvdW5kLCB0cmllZA0KPiBwa2djb25maWcq
ICpBIGZ1bGwgbG9nIGNhbiBiZSBmb3VuZCBhdA0KPiAvaG9tZS90Y3Mvd29yay9zYW5kZWVwL21l
YXN1cmVkX2Jvb3QvaWJtX3FlbXUvcWVtdS9idWlsZC9tZXNvbi1sb2dzL21lDQo+IHNvbi1sb2cu
dHh0Kg0KPiAqTk9USUNFOiBZb3UgYXJlIHVzaW5nIFB5dGhvbiAzLjYgd2hpY2ggaXMgRU9MLiBT
dGFydGluZyB3aXRoIHYwLjYyLjAsDQo+IE1lc29uIHdpbGwgcmVxdWlyZSBQeXRob24gMy43IG9y
IG5ld2VyKg0KPiAqRVJST1I6IG1lc29uIHNldHVwIGZhaWxlZCoNCj4gSSBoYXZlIGFscmVhZHkg
aW5zdGFsbGVkIHNsaXJwIGxvY2FsbHksIGJ1dCBzdGlsbCBnZXR0aW5nIHRoZSBhYm92ZSBlcnJv
ci4NCg0KDQpEaWQgeW91IGluc3RhbGwgdGhlIGxpYnNsaXJwLWRldiBvciBsaWJzbGlycC1kZXZl
bCBwYWNrYWdlID8NCg0KQy4NCg0KDQogVENTIENvbmZpZGVudGlhbA0KPT09PT0tLS0tLT09PT09
LS0tLS09PT09PQpOb3RpY2U6IFRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlLW1h
aWwKbWVzc2FnZSBhbmQvb3IgYXR0YWNobWVudHMgdG8gaXQgbWF5IGNvbnRhaW4gCmNvbmZpZGVu
dGlhbCBvciBwcml2aWxlZ2VkIGluZm9ybWF0aW9uLiBJZiB5b3UgYXJlIApub3QgdGhlIGludGVu
ZGVkIHJlY2lwaWVudCwgYW55IGRpc3NlbWluYXRpb24sIHVzZSwgCnJldmlldywgZGlzdHJpYnV0
aW9uLCBwcmludGluZyBvciBjb3B5aW5nIG9mIHRoZSAKaW5mb3JtYXRpb24gY29udGFpbmVkIGlu
IHRoaXMgZS1tYWlsIG1lc3NhZ2UgCmFuZC9vciBhdHRhY2htZW50cyB0byBpdCBhcmUgc3RyaWN0
bHkgcHJvaGliaXRlZC4gSWYgCnlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgY29tbXVuaWNhdGlvbiBp
biBlcnJvciwgCnBsZWFzZSBub3RpZnkgdXMgYnkgcmVwbHkgZS1tYWlsIG9yIHRlbGVwaG9uZSBh
bmQgCmltbWVkaWF0ZWx5IGFuZCBwZXJtYW5lbnRseSBkZWxldGUgdGhlIG1lc3NhZ2UgCmFuZCBh
bnkgYXR0YWNobWVudHMuIFRoYW5rIHlvdQoKCg==

