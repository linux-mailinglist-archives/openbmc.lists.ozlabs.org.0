Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04194270928
	for <lists+openbmc@lfdr.de>; Sat, 19 Sep 2020 01:29:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtVRX2PcLzDqtK
	for <lists+openbmc@lfdr.de>; Sat, 19 Sep 2020 09:29:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=653035d8c3=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=DuZg9PQ1; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=iJ5Augqs; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtVQf0DbgzDqtK
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 09:28:55 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08INQ3vS012039; Fri, 18 Sep 2020 16:28:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=b//PIq43wwNvTziKH3D2WkWVyWiWWYC/fQFFAtisu6M=;
 b=DuZg9PQ1Ifk608I3PSH5HrXs0DSnJOci12Og8vphDQb8kD7tr3I3dKFT51ZToOboJXla
 aGFdgvnOksPw1t3SLk39G5C2UfAUXWEo1CK2fP/LGTF5kqkf0q16rC47eQoC3qqt/uqi
 nzX4iw7ut8FZoz1mWZVQDirgh8c40IqKSgw= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 33mc4pffvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 18 Sep 2020 16:28:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 18 Sep 2020 16:28:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EG/NWifXxtbsq5cQw0iUQtNcCt6iF94JDQs8NU/1gpN9QSLz/52XXJc/n360Bmo/hSvvMeFP6U/4C6tXle6cfDTqO6IVa7apd6Px9vX0ZQCPwN41c4crzNRhWYNCE7VWRzVGaqlm6iEflwbl8DCcUnOnovZMX+f3D99PabKxdIF14GXKaDUTjrW0D7sMkyXiluwcAwiaC9NaMPWjRULcc5ddJw+iJonT1Ps1CzD20WHBuJPtd3hqbbmm0WJt0YdF8WAcWmFaWTDgkZzVaEcCt98Xq5ON1abRC3NtaDFT6zY/d9iB8qyNYleJpCm9fXX638L4HIS4aPxVuke5QeGN3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b//PIq43wwNvTziKH3D2WkWVyWiWWYC/fQFFAtisu6M=;
 b=krD2hyCLSZXZ3YuU7xeET6vGpxbY/7x/PoC09GCnIJcKLfb7okddRob53Mf4Wdd3uLI9LXRYyxCrN5lYA/VJF92yxtROF9nddPGynxCUfAOHkkqhUVqcEzX7XxmGhQexlZegAQrIPQJqGahK0ep4uNzfVWCC2zHH7zGur7F0D4k/aB0rWiid0jQ+0hLbfQsuhWEbdUNyP0+LWf8CjaB7Vjmh5D1/ZbVMCE0fn9ADhlWKRVNuZC8kLD7dsaigHJDGuVjTpnZ0yb+TLsK9t129T2VFWvEZkYD897bI43Q0hTSy098BTkpNjjX83eMhzJcqoN37v078lJ1DYzrce1/H/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b//PIq43wwNvTziKH3D2WkWVyWiWWYC/fQFFAtisu6M=;
 b=iJ5AugqsYf1A5HSOdLzHSJbKAOtpNGwY6eoO684VNmDs2YmVvc65fJJ4x/E0gWe7MdvIHQDi1MNlGFEfvH0UwPrlI2DCLv+GpSwE+1bZdUH9gLuHJTeOewyB4Zi+KokRcZ+abOgToUr2glg+/6/Togljd9etQtYk2TkHFOldERg=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2566.namprd15.prod.outlook.com (2603:10b6:a03:150::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Fri, 18 Sep
 2020 23:28:50 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3391.014; Fri, 18 Sep 2020
 23:28:50 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Chassis reset
Thread-Topic: Chassis reset
Thread-Index: AQHWjfT7lWI0BIvUr06gDFlShL1iFqlu7CYA//+pggA=
Date: Fri, 18 Sep 2020 23:28:49 +0000
Message-ID: <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
References: <46F3C05C-7CEC-42FD-A9B7-8E55AE56FE3F@fb.com>
 <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
In-Reply-To: <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:65b6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 659b46f1-0357-4794-bf71-08d85c2a9948
x-ms-traffictypediagnostic: BYAPR15MB2566:
x-microsoft-antispam-prvs: <BYAPR15MB256672F40D2522490E39FF66DD3F0@BYAPR15MB2566.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ISqXCZrcqJT1tPvUhkP6gld587qscbQSgG3wAvWBw3kl2MBc2JgAO09wPyexqg3Za6WerQ6vvPHWVYi0gSAGqj7gFRRt9kUFDOBwjf5YNc60H0Fp7R1yPeJYZdSNEXKPKfpeAIXfLQN6+wzvoTxGFH1LtRW+ns1XG5pq7LlI4GkOEbfgLf6aOcXmu4GzeZayYE1cY7EVnyjS3r6fmwRu02qNZvx9wobrm4ilIyZUTii3hr9GmE08pZKqJ00oPZaTsoGD49hKbrVZyjKzV9S2sYa4aKv72iW/MVr33dp8B8irSEb9/Fuw5IXgWguWZkmDH6YOg39MDDDUGxCh817OKtqMORBTxRa/pICdvqjEcsGXuGLI++sJIvZ+s3zEoA/zeBb1xb95Q5h22MD9FxrxZw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(136003)(39860400002)(376002)(396003)(8936002)(2906002)(186003)(6512007)(966005)(76116006)(66946007)(33656002)(53546011)(6506007)(4326008)(478600001)(316002)(36756003)(86362001)(91956017)(66446008)(6486002)(8676002)(5660300002)(83380400001)(6916009)(66476007)(64756008)(66556008)(71200400001)(2616005)(7116003)(3480700007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: lBRdJh/oQSF5tz5G9MZGznXhEN1ZS0gaX9JcvbTWGW76U4dht2PXYne+BQgURhOLoMbzc6YKqxzmaLEcEZHHmi5idXLOo8XdORjm2lFPEHVglsGt0exAycKUogxnc4RFP20AnZL5ZhnUsxHfUDdIYzx2Na5LI49LrXjufDeHXpSnpLbEyPC75vghITzpBBEijtBgkHASjWBX7Kr0A2qznsmmhZcMLWczl+RnawQA9T/QCnzTNYv8gYyjibJSWhNNOk5snRnB7a68m3Dv28o4YnHmvbs0/ENHrWpJweC1ybEAeJvAzRb2YZRCHCSuHX6QH16reWxhr/JQAX/nKgcTEjhk3iUtjbsEK0bCtiqBIyS13sK9kGgOqo7C+Xne8maEHfhiFKRLQXQg6USdrIRzzvMIT/R34twoKQISpnzcMkZZZIgTsGLqiYgHAyT88a6e8+4X7rOqB82lblSFn79eIub5FO/1hF+A4+88I8P4M0PbNPS0xGC3RxIySm+lTr9k85CcrDKpfBiq7gJvvICaVvRq32LhAH4ujYy5Bhb44NUeaGyorSKM4NBLzmrDcRm3Ct7GOYRmZeaDnzrkjqWu4V3/o5T9zv9AuQrCK4HU42uo2QdOsGYk2feluMHqIwc/UBd2WFvrhpDdBv80qKHp3JgEI0c3VsW6ugCz6Qa0awLUtSO0DesamWh8f8VIWX1N
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4AF96A52EF22E14D81E5AD703CDBFC27@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 659b46f1-0357-4794-bf71-08d85c2a9948
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 23:28:50.1149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJEdxCyrEyMZc+hRIKMMLxTtpolyz4qvEj3ItaCi5HEok9b75ba5H/HoWRJBwSV4VRTcJueBaGVgOcy0Hi2vdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2566
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-18_18:2020-09-16,
 2020-09-18 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009180188
X-FB-Internal: deliver
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

DQoNCu+7v09uIDkvMTgvMjAsIDI6MzggUE0sICJFZCBUYW5vdXMiIDxlZEB0YW5vdXMubmV0PiB3
cm90ZToNCg0KICAgIE9uIEZyaSwgU2VwIDE4LCAyMDIwIGF0IDEyOjUyIFBNIFZpamF5IEtoZW1r
YSA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAgICA+DQogICAgPiBUZWFtLA0KICAgID4N
CiAgICA+IEkgYW0gYWdhaW4gd2FudCB0byBkaXNjdXNzIGNvbXBsZXRlIHN5c3RlbSByZXNldC4g
V2UgaGFkIGRpc2N1c3Npb24gaW4gcGFzdCBmb3IgdGhpcyBhbmQgSSBpbXBsZW1lbnRlZCB0aGlz
IGFzIGEgY2hhc3NpcyBpbnN0YW5jZSBzeXN0ZW1fY2hhc3NpczAgYW5kIGFsbG93ZWQgdXNlciB0
byBpbml0aWF0ZSBQb3dlckN5Y2xlIHdoaWNoIHdpbGwgcmVzZXQgdGhlIGNvbXBsZXRlIHN5c3Rl
bS4NCiAgICA+DQogICAgPiBQbGVhc2UgaGVscCBtZSB1bmRlcnN0YW5kIGZvbGxvd2luZyBzY2Vu
YXJpbw0KICAgID4NCiAgICA+IEhvc3QgcmVzZXQg4oCTIHJlc2V0dGluZyBob3N0IG9ubHkNCg0K
ICAgIFNob3VsZCBiZSBkb25lIGJ5IGluaXRpYXRpbmcgYSByZXNldCBhY3Rpb24gb24gdGhlDQog
ICAgL3JlZGZpc2gvdjEvU3lzdGVtcy9zeXN0ZW0gZW5kcG9pbnQuDQoNCiAgICA+IENoYXNzaXMg
cmVzZXQg4oCTIHJlc2V0dGluZyBob3N0IGFuZCBibWMgdmlhIHNpbmdsZSBjb21tYW5kLg0KDQog
ICAgSU1PLCB0aGlzIHNob3VsZG4ndCBiZSBzdXBwb3J0ZWQgYXMgYSBzaW5nbGUgY29tbWFuZCBp
biByZWRmaXNoLiAgSWYNCiAgICB5b3Ugd2FudCB0aGlzIGJlaGF2aW9yLCBpc3N1ZSBhIHJlc2V0
IHRvIHRoZSBTeXN0ZW0gcmVzb3VyY2Ugc2ltaWxhcg0KICAgIHRvIGFib3ZlLCB0aGVuIGlzc3Vl
IGEgc2VwYXJhdGUgcmVzZXQgYWN0aW9uIHRvIHRoZSBNYW5hZ2VyIHJlc291cmNlDQogICAgYXQg
L3JlZGZpc2gvdjEvTWFuYWdlcnMvYm1jLg0KDQogICAgSW4gbGVzcyBjb21wbGljYXRlZCB0ZXJt
cywgSSB0ZW5kIHRvIGFic3RyYWN0IHRoZXNlIGtpbmRzIHJlc2V0IGRvd24gdG86DQogICAgU3lz
dGVtIHJlc2V0OiBSZXNldCBhcyBpZiBJJ2QgZG9uZSBhIHNvZnQvaGFyZCByZXNldCBvZiB0aGUg
bWFpbiBob3N0IHByb2Nlc3Nvcg0KICAgIENoYXNzaXMgcmVzZXQ6IFJlc2V0IGFzIGlmIEknZCB1
bnBsdWdnZWQgdGhlIHBhcnRpY3VsYXIgY29tcG9uZW50IGZyb20NCiAgICBtYWlucyBwb3dlciAo
QUMgb3IgREMpDQogICAgTWFuYWdlciByZXNldDogUmVzZXQgYXMgaWYgSSdkIGRvbmUgYSBzb2Z0
L2hhcmQgcmVzZXQgb2YgdGhlIEJNQw0KSSBjb21wbGV0ZWx5IGFncmVlIHdpdGggeW91IG9uIGFi
b3ZlIHBhcnQuIA0KDQogICAgUGVyIHRoZSBhYm92ZSwgaWYgeW91J3JlIGxvb2tpbmcgZm9yIGEg
Y2hhc3NpcyBsZXZlbCByZXNldCAoSUUgcHVsbGluZw0KICAgIG1haW4gcG93ZXIpIHRoaXMgc2hv
dWxkIGJlIGRvbmUgaW4gYSBDaGFzc2lzIFJlc291cmNlLg0KVGhlbiBjaGFzc2lzIHJlc2V0IHNo
b3VsZCBjYWxsIHByb3BlciBjaGFzc2lzIHJlc2V0IGRidXMgY29tbWFuZC4gDQoNCiAgICA+IFN5
c3RlbSByZXNldCDigJMgVGhpcyBpcyBhIGhhcmQgcmVzZXQgb2YgY29tcGxldGUgc3lzdGVtIGlu
Y2x1ZGluZyBldmVyeSBkZXZpY2UuDQoNCiAgICBUaGlzIGlzIEkgdGhpbmsgdGhlIG5ldyBvbmUg
eW91J3JlIGFkZGluZywgYW5kIHNob3VsZCBiZSBtb2RlbGVkIHVuZGVyDQogICAgYSBuZXcgY2hh
c3NpcyByZXNvdXJjZSAgL3JlZGZpc2gvdjEvQ2hhc3Npcy88Q2hhc3NpcyBuYW1lPiwgYW5kIGJ5
DQogICAgaXNzdWluZyBhIEZvcmNlUmVzZXQgYWN0aW9uIHRvIGl0LiAgSSBrbm93IGluIHRoZSBw
YXN0LCBmb3Igc3lzdGVtcw0KICAgIHRoYXQgd2VyZW4ndCBjYXBhYmxlIG9mIGluaXRpYXRpbmcg
YSBmdWxsIGNoYXNzaXMgcmVzZXQsIHdlJ3ZlIG1vZGVsZWQNCiAgICB0aGlzIGFzIGEgaG9zdCBy
ZXNldCBmb3IgY29tcGF0aWJpbGl0eSBwdXJwb3Nlcy4gIEl0IHNob3VsZCBiZSBub3RlZCwNCiAg
ICB0aGlzIGlzIGFyZ3VhYmx5ICJ3cm9uZyIgYnV0IGtlcHQgYXJvdW5kIGJlY2F1c2Ugd2Ugd2Vy
ZW4ndCBwcmVwYXJlZA0KICAgIHRvIGJyZWFrIGNsaWVudCBpbXBsZW1lbnRhdGlvbnMgdGhhdCBl
eHBlY3RlZCB0aGF0IGFjdGlvbiB0byBiZSB0aGVyZS4NCg0KICAgIEFzIGEgc2lkZSBub3RlLCBp
cyBhbnlvbmUgYSBQTUJVUyBleHBlcnQ/ICBBIHF1aWNrIGxvb2sgYXQgdGhlIHNwZWMNCiAgICBz
ZWVtcyBsaWtlIHRoZXJlIHNob3VsZCBiZSBhIHdheSB0byBpc3N1ZSBhbiBBQy1yZXNldCB0byBh
IFBNQlVTDQogICAgZW5hYmxlZCBwb3dlciBzdXBwbHksIGJ1dCBJIGdvdCBzdHVjayByZWFkaW5n
IHRoZSBkb2NzLCBnaXZlbiB0aGUNCiAgICBjb21wbGV4aXRpZXMgb2YgbW9kZXJuIHBvd2VyIHN1
cHBsaWVzLiAgSXMgdGhlcmUgc29tZW9uZSB0aGF0IGp1c3QNCiAgICBrbm93cyB0aGUgbWFnaWMg
c3RyaW5nIHRvIHNlbmQgdG8gaXQ/ICBJbiB0aGF0IHdheSwgd2UgY291bGQgaW1wbGVtZW50DQog
ICAgdGhlIGFib3ZlIGluIHRoZSAicmlnaHQiIHdheSwgd2hpbGUgc3RpbGwgbm90IGJyZWFraW5n
IHBlb3BsZXMNCiAgICBjb21wYXRpYmlsaXR5IHdpdGggdGhlIG9sZGVyIGludGVyZmFjZXMuICBO
b3cgYmFjayB0byBWaWpheS4NCg0KICAgIEknbSBhc3N1bWluZyBhIGxvdCBvZiB0aGlzIGlzIGlu
IGNvbnRleHQgdG8geW91ciBjdXJyZW50IHBhdGNoOg0KICAgIGh0dHBzOi8vdXJsZGVmZW5zZS5w
cm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fZ2Vycml0Lm9wZW5ibWMtMkRwcm9qZWN0
Lnh5el9jX29wZW5ibWNfYm1jd2ViXy0yQl8zNjU1NyZkPUR3SUZhUSZjPTVWRDBSVHRObFRoM3lj
ZDQxYjNNVXcmcj12OU1VMEtpOXBXblRYQ1d3akhQVmdwbkNSODB2WGtrY3JJYXFVN1VTbDVnJm09
V3NvSC1YTkFPSzNRaDZYOXEwWmpPXzdRZm9GbTM1bmMyVk1ieTM3VVRnUSZzPTFJWVlpRFJOX1pl
RUI2TkF1MVgza2d2RE5ZQ29wenBndnNFWHFxRlZtSDQmZT0gDQoNCiAgICBZb3VyIGV4aXN0aW5n
IHBhdGNoIGRvZXNuJ3Qgd29yayBiZWNhdXNlIHlvdSdyZSBtb2RpZnlpbmcgdGhlDQogICAgUmVk
ZmlzaC1wcm92aWRlZCBlbnVtcyB0byBhZGQgeW91ciBuZXcgYWN0aW9uLCB3aGVuIHJlZGZpc2gg
d291bGQNCiAgICByZWNvbW1lbmQgYWRkaW5nIGEgcmVzb3VyY2Ugc3BlY2lmaWMgdG8gdGhhdCBw
aHlzaWNhbCBib3ggdGhhdCBjYW4NCiAgICBjYWxsIHlvdXIgbmV3IGVuZHBvaW50Lg0KSSBkaWRu
J3Qga25vdyBhYm91dCByZWRmaXNoIGFjdGlvbiBzY2hlbWEsIEkgd2lsbCBjaGFuZ2UgdGhhdC4N
Cg0KICAgID4NCiAgICA+DQogICAgPg0KICAgID4gUmVkZmlzaCBkZWZpbmVzIG9ubHkgYWJvdmUg
MiB0eXBlIGFuZCBzeXN0ZW0gcmVzZXQgY2FuIGJlIGNvdmVyZWQgdW5kZXIgY2hhc3NpcyByZXNl
dC4NCg0KICAgIEknbSBub3QgcmVhbGx5IGZvbGxvd2luZyB0aGlzLiAgUmVkZmlzaCBleHBvc2Vz
IHRoZSBkaWZmZXJlbnQgdHlwZXMNCiAgICB5b3UgbmVlZCB0aHJvdWdoIG11bHRpcGxlIENoYXNz
aXMgUmVzb3VyY2VzLiAgSWYgeW91IGhhdmUgYSBoaWdoZXINCiAgICBsZXZlbCBjaGFzc2lzIHRo
YXQgY29udGFpbnMgaXRlbXMgYmVsb3cgaXQsIHlvdSB3b3VsZCBoYXZlIGEgbmV3DQogICAgQ2hh
c3NpcyByZXNvdXJjZSwgd2hpY2ggaW1wbGVtZW50cyBhIFJlc2V0IGFjdGlvbiBvbiBpdC4NCg0K
ICAgIEknbSBnb2luZyB0byBnbyBvdXQgb24gYSBsaW1iIGFuZCBhc3N1bWUgeW91J3JlIHdvcmtp
bmcgb24gVGlvZ2EgZm9yIGENCiAgICBtb21lbnQuICBJIHdvdWxkIGV4cGVjdCB0aGF0IHRoZSBU
aW9nYSBTbGVkIHRvIGhhdmUgb25lIGNoYXNzaXMsIGFuZA0KICAgIHRoZSBUaW9nYSBCbGFkZUNl
bnRlciB0byBoYXZlIGFub3RoZXIgY2hhc3Npcywgd2l0aCBDb250YWluZWRCeSwNCiAgICBDb250
YWlucywgYW5kIFBvd2VyZWRCeSBsaW5rcyBpbiB0aGUgYXBwcm9wcmlhdGUgcGxhY2VzIG9uIGVh
Y2guDQoNCiAgICA+IEFzIHBlciBpbXBsZW1lbnRhdGlvbiBpbiB4ODYtcG93ZXItY29udHJvbCwg
aG9zdCByZXNldCBhbmQgY2hhc3NpcyByZXNldCBib3RoIHRha2VzIHNhbWUgYWN0aW9uIGxpa2Ug
cmVib290aW5nIGhvc3Qgb25seS4gRm9yIHN5c3RlbSByZXNldCBpdCBoYXMgYSBzZXBhcmF0ZSBp
bnRlcmZhY2Ugc3lzdGVtX2NoYXNzaXMwIGFuZCBQb3dlckN5Y2xlIGNvbW1hbmQgdHJpZ2dlcnMg
dGhpcyByZXNldC4NCg0KICAgIEknbSByZWFsbHkgc3VycHJpc2VkIHRoYXQgdGhpcyBjaGFzc2lz
IGxldmVsIHJlc2V0IHdvdWxkIGdvIGluDQogICAgeDg2LXBvd2VyLWNvbnRyb2wuICBUaGF0IGRh
ZW1vbiBpcyByZWFsbHkgZm9yIGhvc3QgbGV2ZWwgY29udHJvbCwgbm90DQogICAgY2hhc3Npcywg
YW5kIGNvbnNpZGVyaW5nIHRoYXQgYWxtb3N0IGV2ZXJ5IGltcGxlbWVudGF0aW9uIGlzIGdvaW5n
IHRvDQogICAgaGF2ZSBhIGRpZmZlcmVudCB3YXkgdG8gInB1bGwgdGhlIHBvd2VyIiBJJ2QgZXhw
ZWN0IHRoZXNlIHRvIGdvIGluIGENCiAgICBkaWZmZXJlbnQgcmVwbywgb3IgYXQgdGhlIHZlcnkg
bGVhc3QgYSBkaWZmZXJlbnQgYXBwbGljYXRpb24sIHNvIHRoZQ0KICAgIHZhcmlvdXMgQk1DcyBj
YW4gc3dhcCB0aGVtIG91dCB3aXRoIHRoZSBjb3JyZWN0IG9uZSBmb3IgdGhlaXIgY2hhc3Npcy4N
CiAgICBJIHByb2JhYmx5IG1pc3NlZCBhIGRpc2N1c3Npb24gb24gdGhpcyBhIHdoaWxlIGJhY2su
DQoNClRoaXMgd2FzIGFkZGVkIGFzIGEgIHN5c3RlbWQgdGFyZ2V0IGNhbGwgb24gdGhpcyBjb21t
YW5kLiBTbyBwb3dlciBjb250cm9sIHdpbGwgDQpDYWxsIHVzZXIgZGVmaW5lZCBzeXN0ZW0gcmVz
ZXQgdGFyZ2V0IHNlcnZpY2Ugb24gaXNzdWUgb3Igc3lzdGVtIHJlc2V0IGNvbW1hbmQNCkFuZCBl
YWNoIHBsYXRmb3JtIGNhbiBkZXZlbG9wIHRoZWlyIG93biB0YXJnZXQgbGlrZSBzZXR0aW5nIHNv
bWUgaTJjIHJlZ2lzdGVyIG9yDQpTZXR0aW5nIHNvbWUgZ3Bpby4NCg0KICAgID4NCiAgICA+DQog
ICAgPg0KICAgID4gUGxlYXNlIGhlbHAgbWUgaG93IGRvIEkgc3VwcG9ydCB0aGlzIHN5c3RlbSBy
ZXNldCBpbiByZWRmaXNoLg0KDQogICAgSG9wZWZ1bGx5IHRoZSBhYm92ZSBoZWxwcyENClRoYW5r
cywgSXQgZG9lcyBoZWxwcyBhIGxvdC4gSSB3b3VsZCBzdWJtaXQgYSBuZXcgcGF0Y2guDQoNCiAg
ICA+DQogICAgPg0KICAgID4NCiAgICA+IFJlZ2FyZHMNCiAgICA+DQogICAgPiAtVmlqYXkNCg0K
