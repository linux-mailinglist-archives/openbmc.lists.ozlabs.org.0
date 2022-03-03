Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2474CCD47
	for <lists+openbmc@lfdr.de>; Fri,  4 Mar 2022 06:31:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8xL14TTPz30Dv
	for <lists+openbmc@lfdr.de>; Fri,  4 Mar 2022 16:31:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CE0tRP8d;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CE0tRP8d; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8jl91RKgz3bt0
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2022 07:49:08 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 223KVdCT007377; 
 Thu, 3 Mar 2022 20:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=pp1; bh=clJ817VGraWPB6mb2Pb+T0dgCBTib0I7bwzdybVpdMM=;
 b=CE0tRP8dGfBzwlN6UUod3iNrIRM+X1XpXa1ZY/VP3k9foKROQYfHVVA83BagG0nhKm/U
 UpH+/jLJIp8ZZewWmI8S0aq3OnBlRnn8B7ikHD1dNfhDXMztLIohvRhI+lgylV5B9EZ2
 owiTLSYUfDH5QgQAyPgubqXoJZ1p+Qzsqh2CFYKqS25Y02YhidlmL5iRd5xyjxWPgaEc
 FB+g+CVvj010zPSUzMrpYwoasvuZFg8u9+AMkXltUmEBs6qsBorD9DAE2a71AJjlAL5d
 6Bb3rs5U0Ie8tG1l61WOVjwsbr8KxC0MLxr2VvBADzFP5KlKCFtUSjemPL1O6Lye/CCc 3g== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2042.outbound.protection.outlook.com [104.47.73.42])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ek4ssr90s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Mar 2022 20:49:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCM4lNKiyZhALJR/REc3tEqZhUg506PtwINTIpix+JJ7qMWd+yPCI1zvY5008uHw+zlIuWP6rSvGae8ALLWtC64pIItk9zOtpkdQHbuPYx+T/WlwXDed9C1hbenTbNzgQQnOpR7qiAVm5tfV4yEySjt27iJNN6MucUc5ud9gJvcrDX936eJmZkmMXdHYEMJDiur9TfcsyaKb6I2R2NHk/hhXkZBNn96VCOVu2/f97W+GziJWGLllOM2Ue3/5uZVXIC5VC44+ULAACNiGoUHcy6XapG13PkUOydCnZOsJ9EWmQYODQYqYXpn/fvuJdqUnPgMAaYSB1FDPndxGuy+SLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clJ817VGraWPB6mb2Pb+T0dgCBTib0I7bwzdybVpdMM=;
 b=EYfY3oiMpOHW/C2qx7f9J4WkOHfljlPASPECpb1b6U1JwNoBLl9UosZ6c+Bq1ZSuCpyCFsxsuhnElZhQW3KCer7n0KvYRtZ66seubgehokfoiEAAWn1LGV86oGIre0e//uf/OD09Rbe7DzgJ4DyFOKCSnGKbkcgLgYdk7mhL+GoL7kFk+7d8ynEZL2oOSwBuB+HXd971fBPL4OdDH+z/PCi3ZetvRvvdL7Y+FqVOvGXYUZireIRp0w+Qvislx34SWwf7IcJHFhYZIBwYhhjcf3G06iSNb5qwozFnNWO/e1zt5MpFUP2Qyq5aP4+qCkx6IbyAmU4GnQLQByh7Y8x4jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=us.ibm.com; dmarc=pass action=none header.from=us.ibm.com;
 dkim=pass header.d=us.ibm.com; arc=none
Received: from BN6PR15MB1875.namprd15.prod.outlook.com (2603:10b6:405:59::22)
 by DM6PR15MB3724.namprd15.prod.outlook.com (2603:10b6:5:1d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 20:49:03 +0000
Received: from BN6PR15MB1875.namprd15.prod.outlook.com
 ([fe80::31e1:4f3:a2d2:9494]) by BN6PR15MB1875.namprd15.prod.outlook.com
 ([fe80::31e1:4f3:a2d2:9494%11]) with mapi id 15.20.5038.015; Thu, 3 Mar 2022
 20:49:02 +0000
From: Adriana Kobylak <anoo@us.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Issue#3500 : Redfish configuration backup and restore function
Thread-Topic: Issue#3500 : Redfish configuration backup and restore function
Thread-Index: AQHYL0Ads0bV2HjzO06faDlfDiWqIg==
Date: Thu, 3 Mar 2022 20:49:02 +0000
Message-ID: <C4C0D884-73A6-483B-9171-7A4F3F2EB2C2@us.ibm.com>
References: <MA1PR01MB4129D8A087F671A505589AB487039@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <YiEbhAQEdJzf706i@heinlein>
In-Reply-To: <YiEbhAQEdJzf706i@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 070551d6-0a36-4470-1a51-08d9fd574016
x-ms-traffictypediagnostic: DM6PR15MB3724:EE_
x-microsoft-antispam-prvs: <DM6PR15MB37245AC844581FF09BB5DAFEF4049@DM6PR15MB3724.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UegOFlKELQbaf/PpicxOcxWJzLs66oL1vrm5BdxPfb/oSW+se0xuUdYXZzZ0bzVz+sSJMiHT6dyZcUDrKUxnt7ffRnEhJwtT9A9L0t1u6HhRSA0pdCCsezuTbnLkJYSj8o9f3JSykUKVKNuJCkE13znpgTGswRZ1P7aFDffAER1PzvphldooouGuKkVeZws6zSheRqpdcmSm5slaPsEFitxvAeyjZ6+hUG9KYiN3aGqXYO1F1sdyD78eLzE9HBDvZFZ5lfXDHukh4hMWM1U0JktzHNaOS0SfH6yJSE8OG4jGwaQ9F+SHE1RfAiUPMrQwvLFeKtIRTnjpEGMpsSaxwEYHxWnKbFVDEWCZgRTueggoKvIVN7K4FTnGmhI2DKYUbyb4BcMaw0Fub6aQ1khg0bjabExRM2LSuYn5diwysl1NmwNxpJyTsn+707xjsDQaCyVl1a6jpkkiJCl+N6PSNIK9qCQxNGOWFIBIVpuK08y/P4EIG5GmORl8UR0dMT2LI8xb3JphXuMu9673g1NdnLfLWqLfb6/UDRY+WeKwNFZnXaKVQvodWLvjsDnsZUlzTNymbGGUyfawvdbrBTo12W8AwdVcmqlCc3uAp/vYTGsP9Jfd5gKNQmyhGVMQaWbyicMwwQV4md9byYkOLqf+NaeA3RAD/CQUESPIWoMbnhUE+0fceDrMsyPNnE4sSs2oxdWD8lQv6S1wHqe7V0wJ07Oej0nIOttNHMLir5UcHlHypDsLLYvUcKVvasd61Zm8Zxk1jfxgbsPKJYZR4j7a7B+7VKuMh2owzrdNhb2ZupQe195aiwsh3PeD7l/tKgJ3SgfIObXEmK4iAWpx3m/fycsbG3eUCrkuiTSdbBNQKEc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR15MB1875.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(76116006)(5660300002)(8936002)(66446008)(8676002)(66476007)(66556008)(33656002)(64756008)(6916009)(2906002)(316002)(53546011)(186003)(66946007)(26005)(2616005)(91956017)(4326008)(54906003)(166002)(86362001)(508600001)(966005)(122000001)(6486002)(6506007)(71200400001)(6512007)(83380400001)(38070700005)(38100700002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?citudTJFVUFVOFhMcVQ2T3ZwZzN1R0FMYXQzTHB6U1hhd2pBK3ptdWQvU2pp?=
 =?utf-8?B?MUN5Ry95OTBhNTk2eXFxVEFSa3JrMHFBNDFHYUUwSWVNSVJyNm5aY2tRUmVy?=
 =?utf-8?B?S1BWay9qU2tRWmFRNHBBMWZ4NlRGd2VMdjQ3OCtUL2tLcDNyQVVsdUpZeEhV?=
 =?utf-8?B?ZmxnRDNSQ3ZTRGFjM1JIdTFOZzVqbWlSWEdWeVZWNjdWM2syRlZyS0g2Y1ZN?=
 =?utf-8?B?VmV4dzUzcUlCdVdld29IQ25sY3JtaHc3VVdZZmtKZ0JoSjFONmtnTUNOSDNv?=
 =?utf-8?B?cVoyK1NVUmwvZVVXb3lzZW1FZ2M5Z2hjSlNHS0NqSmtnLzUvRkhtSkhkeGw2?=
 =?utf-8?B?bjNSeVZQbjIxcDJzMGhNbCtSKzNGS1M2M2NwU3VQNGQ1bnZxQlBBRDlyanJH?=
 =?utf-8?B?bi9YOXIyMGlmMXl1dEZuUm9OeXVHQXdaU1FuRkZmNC95ajcvMmVVOXR5ZU83?=
 =?utf-8?B?Q2hnWll4SzIwQXY2R3RVSXRoUTlCMEVibnR3UmJxVWhFL1FqOHFYeWtIeUdU?=
 =?utf-8?B?aXFUMGhBaUgrRzBhTVc2V2hHV0VJckE1WTJZVExFNDhrOW1hVTBCSitscWZB?=
 =?utf-8?B?bGJ0QlRuZUk2ZVJxcVAwSllFYU9GNHJBWDhxaHFJT0Yrd0RRMGlNK0NtUDRx?=
 =?utf-8?B?TkNpemRWSTEzNnM0UFk1cXR6TkZ5WDBaY25pNmhJSDc0RGF4K3VscVdEYndI?=
 =?utf-8?B?bExhTUhTQ0pJNmc3T0FxYWNxbjR4YlNJeXlzRFJ5RExoVnBORHZuYnZGa3FQ?=
 =?utf-8?B?VGdaTWxhcUZobjJQVkRWenE2a1U2eDFxYTlUNWNNV1AzZDNqbTR2R0FzUVR3?=
 =?utf-8?B?V0YxcHVZdG4wL2pUcnlJc1dBR0FJdU1SeEtsZHBFd3JuaTJQVmU1VVZYVFlR?=
 =?utf-8?B?WmZGUDd0clg1VHRqWUdhc3RycWVwR0VmNW1xZlpHZ0tqVUdLYVFGTnlpajlw?=
 =?utf-8?B?UkkrTmN2ZWt1blE0V3RObEtXNVNIZWttTktKYjR4QzlYQXBSZ0ZIbUsrUk9F?=
 =?utf-8?B?MUhMNzZsY0U1MFo1OUMwcGlOV1pOd0s5b3VmcFp3L1cwS1lGWUtkcnArM3Ru?=
 =?utf-8?B?d3FyTlRBaE92TDR4c3NiY1lvSVFEb2hiZzEwbFovNkszTWc2SmdjUmR5R1pY?=
 =?utf-8?B?V0JlU1ZRRDlhenNGMGpZYUdSRmQ0YUdBakRUUDJia25YMjV5b1VjNUdoeWVu?=
 =?utf-8?B?WGdrUUFFbWtxMHNkQll6Z2RuQUVES0NjL1lTdWpHaDVJeG5rV2ZGbVJpOHBa?=
 =?utf-8?B?MC8zRDF2d3NqczJ4VFEyakZZYmIxQStBdHBic0RYemxZM3p6MTJJREM0TlJU?=
 =?utf-8?B?N3NGNlYzcWVlT25xbnBQVWFuQTFGem54RjdXajFMbnZKL3FteXRXSTYvNHMx?=
 =?utf-8?B?ckdiU2x1ZkwwOFFvcFhrNXI2YVpRcXBIVVBDRVJkd2lUdllqU1pCaG1kVU81?=
 =?utf-8?B?M0NQY2FvRXI3TTdhek5GZnNTb1UvUVFNNUp1ZmNNTFl5MUlaa1RTdjhVNE5k?=
 =?utf-8?B?amtZRkhvYlRZNjd2c2NjRmh6U1htaGw4c0FLckZBc2lwa2g5cWQ3YnkrQ2hI?=
 =?utf-8?B?ZzhUNElNeE9QeWZGNXpVNHNuQ3FVMCtLVmN0TUxCMFkxSThVMmkvb3lnUGti?=
 =?utf-8?B?MW5aTm41S28wa2FneUgxMUtTak9mamhaZVFPdXpXVm9LT005YzI5YXpQcjVD?=
 =?utf-8?B?cVd5c0J0TVJoQysxQW5lY1U2UUFnNnBxNjNMbHFqYnBaQ3BEalBNVjBkMnEy?=
 =?utf-8?B?YUFOd1h4VGEwR3NBT3RSZmRETGtmVXg4WUxxZ1g4MjNoSGZmaHlsc0hNK3g0?=
 =?utf-8?B?RXZiRkt3SDgrcXE4eXB6SHRCb0psLytrZklDeEdmZC95WDAxNkF0VDl0SlNl?=
 =?utf-8?B?MFo5ME5yemduSGk5eUdXaURiTFo3Y0FJVytSUFFrR0tVVWJoRWJuWTFYTS9Z?=
 =?utf-8?B?RXdKaWJ4V3ZPMUloYU1lanFiWnZuM1RXNTFaSjhZTERvQ0o2SStNcEJDMVNY?=
 =?utf-8?B?ZDFnNHEyYlFjOHdKVkc5S0loRGlJMHgyWEo3UjdXcnJXRUtlSU5COFVoc3dh?=
 =?utf-8?B?K2N6ZVdXNE1meE4zUmErRC85ZDRCeDczOXBaWFNTM21LdUpZcEloSzhWam1G?=
 =?utf-8?Q?HNyc=3D?=
Content-Type: multipart/alternative;
 boundary="_000_C4C0D88473A6483B91717A4F3F2EB2C2usibmcom_"
X-OriginatorOrg: us.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR15MB1875.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 070551d6-0a36-4470-1a51-08d9fd574016
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 20:49:02.6933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YRdWkyLh7pCdhae/XRsPK5JRsS4Fk/8Cd5PwDfsKHB6lD0aNbVTGWO3Cuf/Cctjf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB3724
X-Proofpoint-ORIG-GUID: SESEe_00KsEIadt1jd0c5OVwH_FkyLRU
X-Proofpoint-GUID: SESEe_00KsEIadt1jd0c5OVwH_FkyLRU
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-03_09,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxlogscore=573 mlxscore=0 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 clxscore=1011 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203030091
X-Mailman-Approved-At: Fri, 04 Mar 2022 16:30:32 +1100
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
Cc: Gunnar Mills <gmills@us.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Sandeep Kumar <sandeep.pkumar@tcs.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_C4C0D88473A6483B91717A4F3F2EB2C2usibmcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCk9uIE1hciAzLCAyMDIyLCBhdCAxOjQ4IFBNLCBQYXRyaWNrIFdpbGxpYW1zIDxwYXRyaWNr
QHN0d2N4Lnh5ejxtYWlsdG86cGF0cmlja0BzdHdjeC54eXo+PiB3cm90ZToNCg0KT24gV2VkLCBN
YXIgMDIsIDIwMjIgYXQgMDc6NTQ6MzBBTSArMDAwMCwgU2FuZGVlcCBLdW1hciB3cm90ZToNCkhp
LA0KDQpXaGlsZSBsb29raW5nIGF0IHRoZSBpc3N1ZXMgbGlzdCwgY2FtZSBhY3Jvc3MgdGhpcy4g
V2Ugd291bGQgbGlrZSB0byB0YWtlIHRoaXMgdXAgYW5kIHdvcmsgb24gaXQuIEFueSBoZWxwIHRv
IGdldHRpbmcgdXAgdG8gc3BlZWQgd291bGQgaGVscC4NCg0KVGhhbmtzLA0KU2FuZGVlcC4NCg0K
aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy9pc3N1ZXMvMzUwMA0KDQpJdCBsb29r
ZWQgbGlrZSB0aGlzIHdhcyBhbiBpc3N1ZSB0aGF0IHdhcyBvZiBpbnRlcmVzdCBvcmlnaW5hbGx5
IHRvIElCTT8gIFRoZQ0KZGVzaWduIHdhcyBhYmFuZG9uZWQgaW4gR2Vycml0IGFuZCB0aGVyZSBh
cHBlYXJzIHRvIGhhdmUgYmVlbiBubyBwcm9ncmVzcyBhdCB0aGUNCkRNVEYgb24gUmVkZmlzaCBp
bnRlcmZhY2VzLg0KDQpHdW5uYXIgYW5kIEFkcmlhbmEsIGNhbiB5b3Ugd2VpZ2ggaW4/DQoNCkhp
LCB5ZXMsIElCTSB3YXMgYW5kIGlzIHN0aWxsIGludGVyZXN0ZWQgaW4gdGhpcyBmZWF0dXJlIGJ1
dCBoYXMgYmVlbiBsb3dlciBwcmlvcml0eS4gSSBtZXQgd2l0aCB0aGUgRE1URiBhIHdoaWxlIGJh
Y2sgYW5kIHRoZXkgaGF2ZSBhZ3JlZWQgb24gdGhlIG5lZWQgdG8gaGF2ZSB0aGlzIGZ1bmN0aW9u
YWxpdHkgYW5kIGhhdmUgbWFkZSByZWNvbW1lbmRhdGlvbnMgb24gdGhlIGltcGxlbWVudGF0aW9u
LCB0aGV5IGFyZSBqdXN0IGFza2luZyBmb3IgYSB2b2x1bnRlZXIgdG8gcHJvcG9zZSB0aGUgc2No
ZW1hLCB0aGVpciBndWlkZWxpbmUgaXMgdG8gc3VwcG9ydCBhIGJsb2Igc3BlY2lmaWMgdG8gdGhl
IGltcGxlbWVudGF0aW9uIChpbnN0ZWFkIG9mIHNwZWNpZmljIGludGVyZmFjZXMgdG8gYmFja3Vw
L3Jlc3RvcmUpIGFuZCBoYXZlIHRoZSBpbXBsZW1lbnRhdGlvbiBkZWNpZGUgb24gdGhlIGZvcm1h
dCBhbmQgaGFuZGxpbmcvZGVjb2Rpbmcgb2YgdGhlIGJsb2IuIFRoZSBiaW5hcnkgYmxvYiB3b3Vs
ZCBiZSB1cGxvYWRlZCB1c2luZyB0aGUgZXhpc3RpbmcgUmVkZmlzaCBtdWx0aXBhcnQgZm9ybS4N
Cg0KRm9yIHRoZSBkaXNjdXNzaW9uIGRldGFpbHMgeW91IGNhbiBzdWJzY3JpYmUgdG8gdGhlIERN
VEYgZ2l0aHViIGFuZCBsb29rIGF0IGlzc3VlOiBodHRwczovL2dpdGh1Yi5jb20vRE1URi9SZWRm
aXNoL2lzc3Vlcy8zNDMwDQoNCkl04oCZZCBiZSBvZiBncmVhdCBoZWxwIHRvIHN1Ym1pdCB0aGUg
c2NoZW1hIHByb3Bvc2FsIGFuZCBnZXQgaXQgdGhyb3VnaCB0aGUgYXBwcm92YWwgcHJvY2Vzcywg
dGhlIHNjaGVtYSB3b3VsZCBub3QgYmUgdmVyeSBjb21wbGV4LCB0aGVuIHRoZSBuZXh0IHN0ZXAg
d291bGQgYmUgdG8gZGlzY3VzcyB3aXRoaW4gT3BlbkJNQyBob3cgd2Ugd2FudCB0byBoYW5kbGUg
dGhlIGJsb2IgYW5kIHdoYXQgZGF0YSB3ZSB3YW50IGJhY2tlZCB1cCAvIHJlc3RvcmVkLg0KDQoN
Ci0tDQpQYXRyaWNrIFdpbGxpYW1zDQoNCg==

--_000_C4C0D88473A6483B91717A4F3F2EB2C2usibmcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <399771D768F6404FB024566EC40C250D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IHN0eWxlPSJ3b3JkLXdy
YXA6IGJyZWFrLXdvcmQ7IC13ZWJraXQtbmJzcC1tb2RlOiBzcGFjZTsgbGluZS1icmVhazogYWZ0
ZXItd2hpdGUtc3BhY2U7IiBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCjxkaXY+PGJyIGNsYXNz
PSIiPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPk9u
IE1hciAzLCAyMDIyLCBhdCAxOjQ4IFBNLCBQYXRyaWNrIFdpbGxpYW1zICZsdDs8YSBocmVmPSJt
YWlsdG86cGF0cmlja0BzdHdjeC54eXoiIGNsYXNzPSIiPnBhdHJpY2tAc3R3Y3gueHl6PC9hPiZn
dDsgd3JvdGU6PC9kaXY+DQo8YnIgY2xhc3M9IkFwcGxlLWludGVyY2hhbmdlLW5ld2xpbmUiPg0K
PGRpdiBjbGFzcz0iIj4NCjxkaXYgY2xhc3M9IiI+T24gV2VkLCBNYXIgMDIsIDIwMjIgYXQgMDc6
NTQ6MzBBTSArMDAwMCwgU2FuZGVlcCBLdW1hciB3cm90ZTo8YnIgY2xhc3M9IiI+DQo8YmxvY2tx
dW90ZSB0eXBlPSJjaXRlIiBjbGFzcz0iIj5IaSw8YnIgY2xhc3M9IiI+DQo8YnIgY2xhc3M9IiI+
DQpXaGlsZSBsb29raW5nIGF0IHRoZSBpc3N1ZXMgbGlzdCwgY2FtZSBhY3Jvc3MgdGhpcy4gV2Ug
d291bGQgbGlrZSB0byB0YWtlIHRoaXMgdXAgYW5kIHdvcmsgb24gaXQuIEFueSBoZWxwIHRvIGdl
dHRpbmcgdXAgdG8gc3BlZWQgd291bGQgaGVscC48YnIgY2xhc3M9IiI+DQo8YnIgY2xhc3M9IiI+
DQpUaGFua3MsPGJyIGNsYXNzPSIiPg0KU2FuZGVlcC48YnIgY2xhc3M9IiI+DQo8L2Jsb2NrcXVv
dGU+DQo8YnIgY2xhc3M9IiI+DQo8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9v
cGVuYm1jL2lzc3Vlcy8zNTAwIiBjbGFzcz0iIj5odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9v
cGVuYm1jL2lzc3Vlcy8zNTAwPC9hPjxiciBjbGFzcz0iIj4NCjxiciBjbGFzcz0iIj4NCkl0IGxv
b2tlZCBsaWtlIHRoaXMgd2FzIGFuIGlzc3VlIHRoYXQgd2FzIG9mIGludGVyZXN0IG9yaWdpbmFs
bHkgdG8gSUJNPyAmbmJzcDtUaGU8YnIgY2xhc3M9IiI+DQpkZXNpZ24gd2FzIGFiYW5kb25lZCBp
biBHZXJyaXQgYW5kIHRoZXJlIGFwcGVhcnMgdG8gaGF2ZSBiZWVuIG5vIHByb2dyZXNzIGF0IHRo
ZTxiciBjbGFzcz0iIj4NCkRNVEYgb24gUmVkZmlzaCBpbnRlcmZhY2VzLjxiciBjbGFzcz0iIj4N
CjxiciBjbGFzcz0iIj4NCkd1bm5hciBhbmQgQWRyaWFuYSwgY2FuIHlvdSB3ZWlnaCBpbj88YnIg
Y2xhc3M9IiI+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPGRpdj48YnIgY2xhc3M9
IiI+DQo8L2Rpdj4NCjxkaXY+SGksIHllcywgSUJNIHdhcyBhbmQgaXMgc3RpbGwgaW50ZXJlc3Rl
ZCBpbiB0aGlzIGZlYXR1cmUgYnV0IGhhcyBiZWVuIGxvd2VyIHByaW9yaXR5LiBJIG1ldCB3aXRo
IHRoZSBETVRGIGEgd2hpbGUgYmFjayBhbmQgdGhleSBoYXZlIGFncmVlZCBvbiB0aGUgbmVlZCB0
byBoYXZlIHRoaXMgZnVuY3Rpb25hbGl0eSBhbmQgaGF2ZSBtYWRlIHJlY29tbWVuZGF0aW9ucyBv
biB0aGUgaW1wbGVtZW50YXRpb24sIHRoZXkgYXJlIGp1c3QgYXNraW5nDQogZm9yIGEgdm9sdW50
ZWVyIHRvIHByb3Bvc2UgdGhlIHNjaGVtYSwgdGhlaXIgZ3VpZGVsaW5lIGlzIHRvIHN1cHBvcnQg
YSBibG9iIHNwZWNpZmljIHRvIHRoZSBpbXBsZW1lbnRhdGlvbiAoaW5zdGVhZCBvZiBzcGVjaWZp
YyBpbnRlcmZhY2VzIHRvIGJhY2t1cC9yZXN0b3JlKSBhbmQgaGF2ZSB0aGUgaW1wbGVtZW50YXRp
b24gZGVjaWRlIG9uIHRoZSBmb3JtYXQgYW5kIGhhbmRsaW5nL2RlY29kaW5nIG9mIHRoZSBibG9i
LiBUaGUgYmluYXJ5IGJsb2INCiB3b3VsZCBiZSB1cGxvYWRlZCB1c2luZyB0aGUgZXhpc3Rpbmcg
UmVkZmlzaCBtdWx0aXBhcnQgZm9ybS48L2Rpdj4NCjxkaXY+PGJyIGNsYXNzPSIiPg0KPC9kaXY+
DQo8ZGl2PkZvciB0aGUgZGlzY3Vzc2lvbiBkZXRhaWxzIHlvdSBjYW4gc3Vic2NyaWJlIHRvIHRo
ZSBETVRGIGdpdGh1YiBhbmQgbG9vayBhdCBpc3N1ZTombmJzcDs8YSBocmVmPSJodHRwczovL2dp
dGh1Yi5jb20vRE1URi9SZWRmaXNoL2lzc3Vlcy8zNDMwIiBjbGFzcz0iIj5odHRwczovL2dpdGh1
Yi5jb20vRE1URi9SZWRmaXNoL2lzc3Vlcy8zNDMwPC9hPjwvZGl2Pg0KPGRpdj48YnIgY2xhc3M9
IiI+DQo8L2Rpdj4NCjxkaXY+SXTigJlkIGJlIG9mIGdyZWF0IGhlbHAgdG8gc3VibWl0IHRoZSBz
Y2hlbWEgcHJvcG9zYWwgYW5kIGdldCBpdCB0aHJvdWdoIHRoZSBhcHByb3ZhbCBwcm9jZXNzLCB0
aGUgc2NoZW1hIHdvdWxkIG5vdCBiZSB2ZXJ5IGNvbXBsZXgsIHRoZW4gdGhlIG5leHQgc3RlcCB3
b3VsZCBiZSB0byBkaXNjdXNzIHdpdGhpbiBPcGVuQk1DIGhvdyB3ZSB3YW50IHRvIGhhbmRsZSB0
aGUgYmxvYiBhbmQgd2hhdCBkYXRhIHdlIHdhbnQgYmFja2VkIHVwIC8gcmVzdG9yZWQuPC9kaXY+
DQo8YnIgY2xhc3M9IiI+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBjbGFzcz0iIj4NCjxkaXYg
Y2xhc3M9IiI+DQo8ZGl2IGNsYXNzPSIiPjxiciBjbGFzcz0iIj4NCi0tIDxiciBjbGFzcz0iIj4N
ClBhdHJpY2sgV2lsbGlhbXM8YnIgY2xhc3M9IiI+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ibG9ja3F1
b3RlPg0KPC9kaXY+DQo8YnIgY2xhc3M9IiI+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_C4C0D88473A6483B91717A4F3F2EB2C2usibmcom_--
