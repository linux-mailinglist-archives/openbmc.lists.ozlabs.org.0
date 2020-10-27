Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D5A29CCF2
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 02:37:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLWRC2QvCzDqNm
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 12:37:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=dell.com (client-ip=67.231.157.37;
 helo=mx0b-00154901.pphosted.com; envelope-from=joshua.giles@dell.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=Dell.onmicrosoft.com header.i=@Dell.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-Dell-onmicrosoft-com header.b=GrbCtSJe;
 dkim-atps=neutral
X-Greylist: delayed 2833 seconds by postgrey-1.36 at bilbo;
 Wed, 28 Oct 2020 05:55:58 AEDT
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLLWf4V3YzDqLp
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 05:55:53 +1100 (AEDT)
Received: from pps.filterd (m0134318.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09RHuIKq101548; Tue, 27 Oct 2020 14:08:37 -0400
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by mx0a-00154901.pphosted.com with ESMTP id 34ef7f2nsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Oct 2020 14:08:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFqaQ6vDaZI0u3cJPN4Opl+6K/atMmSfqlMypTBO2lDz6u1aTPK1Qk00JUxZQc1Ttarp3KnrIDoJ78cqI1OMbBrY9nBxVdxByBJvdryCqbLywKq9o0brUDb0gltIH/FvllzJxT0ecVSrtaW+sNJTtXHT0EXkkbar08d2cE5zGqhVIhwMUJ6HW/mgAsknRSvw24DppvBqs+LlkS51AzW8CLtVvbfM+CE0Qi4AXN5olV9mDBf719lLGKwhVRHhAus6LQw+qI31XC79MaBbwXb5YMSjScKlx92Z3yyPAyW4bnH9s+AHRkTa/aDL6bxXOEMy32Njyvyfn8DjtGzjE28zfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/f9oLJN+JJwafvvj4cAcXdPIIfdrxuItw2TSXD8y0F0=;
 b=MEnVaQ+QyZ1L/FTsKJJsR59PCCE31tvx2gRriTfQa7MQAa24ICrFCsDa9b8dHa+c8cMCLsroG2Fntxn3H/fMqmFxmAjnWil3lI5a9I5VoZXyi5oka0jQqt5Xw0+lwot8+l1X+EYfGsO71wwGPGzjweJR5mmF6KNklRUeGvo7ul2GiG0Lb1jAhIdJdgbxfQRmBOGx3f8f5ljO8/ZiGA6wZTtkMwTj2A9XM9KfoL8/QVcl+GeXRvqvxYZgCM4odCObDIO4Apd3VOXWC/5Ws0F/cMi+ib14CdHKXDc3lCeb5dVFAXcaInnmaEXX4x/ZwK8Lw3D+uDA542B7A/e/1YuDlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com; 
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/f9oLJN+JJwafvvj4cAcXdPIIfdrxuItw2TSXD8y0F0=;
 b=GrbCtSJePH1wD5wSnAaRP6gBZUOPWyNvJDOIqWfknzQyBMFOQF26Qkk6YkQyFbEpui7IR4EhBZCBmzSKMe8fKpi/DgWyCF8n3kYRQsHlwBe4Cz1G0yaVOMTZRoQN33Ne/d5mtqQqaAWSsWOBx9WTu93qhChVpK3f2cK1D6zB+Hs=
Received: from DM6PR19MB3561.namprd19.prod.outlook.com (2603:10b6:5:1df::25)
 by DM5PR19MB1372.namprd19.prod.outlook.com (2603:10b6:3:142::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Tue, 27 Oct
 2020 18:08:35 +0000
Received: from DM6PR19MB3561.namprd19.prod.outlook.com
 ([fe80::78e9:ca4e:7200:3b42]) by DM6PR19MB3561.namprd19.prod.outlook.com
 ([fe80::78e9:ca4e:7200:3b42%3]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 18:08:35 +0000
From: "Giles, Joshua" <Joshua.Giles@dell.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: webui not working for me
Thread-Topic: webui not working for me
Thread-Index: Adasi5KZMvLuVV/8RcqhbCJ8mNXeCA==
Date: Tue, 27 Oct 2020 18:08:35 +0000
Message-ID: <DM6PR19MB35616978E773D2F8CBA35DFE95160@DM6PR19MB3561.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Joshua_Giles@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-10-27T18:08:33.9263169Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=96423b4f-5179-475d-996b-30413e0b6cde;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [143.166.255.127]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fece04d7-3d5a-4257-9748-08d87aa352a4
x-ms-traffictypediagnostic: DM5PR19MB1372:
x-microsoft-antispam-prvs: <DM5PR19MB1372186C303F429B5E7A7D0495160@DM5PR19MB1372.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nZ7IPq3NdYgFk0j7cJeu6ctL46BAHWtY6hAKRZw+T/cIk8TpoudoKqHeCVdzr4KVzaUa1RqJsYAKSFcqYHejKJ6mkMgkbSGSX0rZmQohWGmBc11tua7j8cFyWiDZVb/G8xsosQGMhqZrNnueFY5s0ki+5B86JgaF+9ESL+Zne3yOmfNZKBXrEmx5HFqwbARaYDpIrKlvxUXKHt9JoGNdkFmZzPnFzhVfV0Kv9c4m5yTsJ8Kno3TIIBkWguL07z8NCKA02G8/nQ4OOGAlQlL+VRIcVcorvLtIfNoRXEJ2TNkc6UyDm/vIFDDYBHhsK/KRI9UzSNPY6Vb3xyJOvOFmVkKHTddKi0NwqFKurO7MbtZWge1Wi4UHqGLJ8B3pQoil8IeQuOj/PRKidlg3qUe95A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR19MB3561.namprd19.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(8936002)(7696005)(55016002)(66946007)(316002)(786003)(71200400001)(86362001)(52536014)(8676002)(76116006)(5660300002)(6916009)(33656002)(2906002)(9686003)(186003)(26005)(66476007)(4326008)(64756008)(83380400001)(66446008)(66556008)(478600001)(53546011)(6506007)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: av5opaP5mfG0qoLtcWNf5WqLDLMu4u4SDA4Slj1q/gUzO6QYGvgsbI7GqTvSEU4KDHtrUv9ayZgxRG19CjoctEOG3jn81LDIa7A+WIuNR7yfNXVvXVN0h8N4ymKPSFfs9ZyYl11kDuyteGh9IRkno6mn/7IdaPuu1Co9vzbRH/Shu006UyDSn2/lycHPxtf3lAL97q/AWOS7J46TJTRWbDbD/HiQQ/m3PDLCefAkenVqRwWg0IhtsOJkthvX7lzmRSc3xEJOqlWKAHaNlLsuDJMEViqL9R0fPbsBqMnhMH32LDoq1kJ4FGV79MSKU7TeNI4wiAWSNDQEdlzF78CcMorbzL0DuI0dLePEDOLlHFr1hG3JpimaZCooSsE7JMcH6WVVSgW3seqqSmhlMaRsY243SP94o6UzmQ7ni+XUWWVTTWXQ56yYSBz2A3uo5RmO4TArQA1kwdjUkAT6BcONysI5M5WPGFu+9wtNSnGFLBKlyJQoaDvdX+EjxNketBY1/7t0z3tvU1Qyz00quNRblzSlmnLHXmDmo/HH++YM16iJDsB4VFIk25xM9M+eFTIxVMI5kiBgXgEfoO34IYC7nCTllxr/uMC3eLt2ItKUZHtgz5EjQU0CzCpm9unvPBq8mEkER0oVvNcF4+BAgq9K5A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB3561.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fece04d7-3d5a-4257-9748-08d87aa352a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 18:08:35.6692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hUjDvmzVgVvzuLH7UwRATe+l7NYM1UNWM8cFZDXTgAbVhHeMYjkKoseAJHIoqtkFTjc3mOrn83HYdbvX3q4iBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR19MB1372
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-27_10:2020-10-26,
 2020-10-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 clxscore=1011 priorityscore=1501 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010270107
X-Mailman-Approved-At: Wed, 28 Oct 2020 12:30:19 +1100
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
Cc: "kathryn.elainex.pine@intel.com" <kathryn.elainex.pine@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGVsbG8gS2F0aHJ5biwNCg0KVGhlIGdlcnJpdCBsaW5rIHlvdSBoYWQgYmVsb3cgaXMgcmV0dXJu
aW5nIGEgNDA0OyBDYW4geW91IHBvaW50IG1lIHRvIGEgbG9jYXRpb24gd2hlcmUgSSBjYW4gc2Vl
IHRoaXMgcGF0Y2g/DQoNCi1Kb3NoDQoNCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcytr
YXRocnluLmVsYWluZXgucGluZT1pbnRlbC5jb20gYXQgbGlzdHMub3psYWJzLm9yZz4gT24gQmVo
YWxmIE9mIFZpamF5IEtoZW1rYQ0KU2VudDogTW9uZGF5LCBKYW51YXJ5IDYsIDIwMjAgNDo0NiBQ
TQ0KVG86IEd1bm5hciBNaWxscyA8Z21pbGxzIGF0IGxpbnV4LnZuZXQuaWJtLmNvbT47IG9wZW5i
bWMgYXQgbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6IHdlYnVpIG5vdCB3b3JraW5nIGZv
ciBtZQ0KDQpIaSwNCg0KSeKAmXZlIHVwbG9hZGVkIGEgd29yayBpbiBwcm9ncmVzcyBwYXRjaCB3
aXRoIHRoZSBzZW5zb3JzIHBhZ2UgdXNpbmcgUmVkZmlzaCBkYXRhLg0KDQpJIHB1bGxlZCBtb3N0
IG9mIHRoZSBJbnRlbCBkb3duc3RyZWFtIFVJIG9mZiBzbyBpdOKAmXMgYSBiaXQgcGxhaW4gbG9v
a2luZywgYnV0IHNob3VsZCBoYXZlIHRoZSBmdW5jdGlvbmFsaXR5IG5lZWRlZCBmb3IgdXNpbmcg
UmVkZmlzaCBmb3Igc2Vuc29yczoNCg0KaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5
ei9jL29wZW5ibWMvcGhvc3Bob3Itd2VidWkvKy8yODM0MjxodHRwczovL3VybGRlZmVuc2UucHJv
b2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2dlcnJpdC5vcGVuYm1jLTJEcHJvamVjdC54
eXpfY19vcGVuYm1jX3Bob3NwaG9yLTJEd2VidWlfLTJCXzI4MzQyJmQ9RHdNRkFnJmM9NVZEMFJU
dE5sVGgzeWNkNDFiM01VdyZyPXY5TVUwS2k5cFduVFhDV3dqSFBWZ3BuQ1I4MHZYa2tjcklhcVU3
VVNsNWcmbT1Ka1ZuYzZ4Y3NyT1FGT3ozVC0xQkRmZlFPSk55TkY0d1ZBNWJLdzhiSWhBJnM9dEFX
ZXJrOUJPYTBFU042ZzQxZko0cFQ1RnN2VmhJRHlnVEJyRnpRVmY4USZlPT4NCg0KSWYgdGhlcmXi
gJlzIHZhbHVlIGluIGdldHRpbmcgdGhpcyBpbnRvIHVwc3RyZWFtLCBwbGVhc2UgbGV0IG1lIGtu
b3cg4oCTIHdvdWxkIHJlcXVpcmUgYSBiaXQgbW9yZSBjb29yZGluYXRpbmcgYW5kIFVJIHR3ZWFr
cyB0byBnZXQgdGhpcyB0byBtYXRjaCB1cHN0cmVhbSwgd2hpY2ggaXMgd2h5IGZvciBub3cgSSBq
dXN0IHVwbG9hZGVkIGFzIFdJUC4NCg0KQmVzdCwNCkthdGh5DQoNCg0KRnJvbTogb3BlbmJtYyA8
b3BlbmJtYy1ib3VuY2VzK2thdGhyeW4uZWxhaW5leC5waW5lPWludGVsLmNvbSBhdCBsaXN0cy5v
emxhYnMub3JnPiBPbiBCZWhhbGYgT2YgVmlqYXkgS2hlbWthDQpTZW50OiBNb25kYXksIEphbnVh
cnkgNiwgMjAyMCA0OjQ2IFBNDQpUbzogR3VubmFyIE1pbGxzIDxnbWlsbHMgYXQgbGludXgudm5l
dC5pYm0uY29tPjsgb3BlbmJtYyBhdCBsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTogd2Vi
dWkgbm90IHdvcmtpbmcgZm9yIG1lDQoNCg0KDQpGcm9tOiBHdW5uYXIgTWlsbHMgPGdtaWxscyBh
dCBsaW51eC52bmV0LmlibS5jb208bWFpbHRvOmdtaWxscyBhdCBsaW51eC52bmV0LmlibS5jb20+
Pg0KRGF0ZTogTW9uZGF5LCBKYW51YXJ5IDYsIDIwMjAgYXQgNDo0MCBQTQ0KVG86IFZpamF5IEto
ZW1rYSA8dmlqYXlraGVta2EgYXQgZmIuY29tPG1haWx0bzp2aWpheWtoZW1rYSBhdCBmYi5jb20+
PiwgIm9wZW5ibWMgYXQgbGlzdHMub3psYWJzLm9yZzxtYWlsdG86b3BlbmJtYyBhdCBsaXN0cy5v
emxhYnMub3JnPiIgPG9wZW5ibWMgYXQgbGlzdHMub3psYWJzLm9yZzxtYWlsdG86b3BlbmJtYyBh
dCBsaXN0cy5vemxhYnMub3JnPj4NClN1YmplY3Q6IFJlOiB3ZWJ1aSBub3Qgd29ya2luZyBmb3Ig
bWUNCg0KDQoNCk9uIDEvNi8yMDIwIDY6MjkgUE0sIFZpamF5IEtoZW1rYSB3cm90ZToNCg0KSXQg
c2F5cyBvbiBwYWdlIOKAnHRoZXJlIGFyZSBubyBzZW5zb3JzIGF2YWlsYWJsZeKAnQ0KDQoNCkEg
Y3VybCBjYWxsIHRvIC94eXovb3BlbmJtY19wcm9qZWN0L3NlbnNvcnMvZW51bWVyYXRlIHJldHVy
bnMgYWxsIHRoZSBzZW5zb3JzIGNvcnJlY3RseSA/DQoNCkkgaGF2ZSBub3QgdXNlZCBhbnkgY3Vy
bCBjb21tYW5kIGhlcmUuIFBsZWFzZSBsZXQgbWUga25vdyB3aGF0IGN1cmwgY29tbWFuZCB0byB1
c2UuIEJ1dCBpbnRlbCBpcyB1c2luZyByZWRmaXNoIG1ldGhvZCB0byBnZXQgdGhlc2UgZGF0YS4N
Cg0KaHR0cHM6Ly9naXRodWIuY29tL0ludGVsLUJNQy9waG9zcGhvci13ZWJ1aS9ibG9iL2UzNGY0
NmMxOTFhNGM5OTM2MDhhYzY0YTg2NzkyMGZiNjQwZTgxMzMvYXBwL2NvbW1vbi9zZXJ2aWNlcy9h
cGktdXRpbHMuanMjTDkzMg0KDQoNCklmIHNvLCBwcm9iYWJseSB3aWxsIG5lZWQgdG8gYWRkIHNv
bWUgY29uc29sZS5sb2coKXMgdG8gdGhhdCBmdW5jdGlvbg0KaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5ibWMvcGhvc3Bob3Itd2VidWkvYmxvYi9mNzBmNDI1NTM2MTU5NzIxNjNiMzZjOWI0ZDc3YmUw
N2U0Mzk5MTIyL2FwcC9jb21tb24vc2VydmljZXMvYXBpLXV0aWxzLmpzI0w5MTINCi0tLS0tLS0t
LS0tLS0tIG5leHQgcGFydCAtLS0tLS0tLS0tLS0tLQ0KQW4gSFRNTCBhdHRhY2htZW50IHdhcyBz
Y3J1YmJlZC4uLg0KVVJMOiA8aHR0cDovL2xpc3RzLm96bGFicy5vcmcvcGlwZXJtYWlsL29wZW5i
bWMvYXR0YWNobWVudHMvMjAyMDAxMDkvZTg4M2FiN2IvYXR0YWNobWVudC5odG0+DQpQcmV2aW91
cyBtZXNzYWdlIChieSB0aHJlYWQpOiB3ZWJ1aSBub3Qgd29ya2luZyBmb3IgbWUNCk5leHQgbWVz
c2FnZSAoYnkgdGhyZWFkKTogd2VidWkgbm90IHdvcmtpbmcgZm9yIG1lDQpNZXNzYWdlcyBzb3J0
ZWQgYnk6IFsgZGF0ZSBdIFsgdGhyZWFkIF0gWyBzdWJqZWN0IF0gWyBhdXRob3IgXQ0KTW9yZSBp
bmZvcm1hdGlvbiBhYm91dCB0aGUgb3BlbmJtYyBtYWlsaW5nIGxpc3QNCg==
