Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3FF29F531
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 20:29:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMb9h71FszDqLg
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 06:29:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=85713010a6=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=Tyb2bnXJ; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=aXBtpxoI; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMb733Gk8zDqby
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 06:27:24 +1100 (AEDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09TJ9WGI014703; Thu, 29 Oct 2020 12:27:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=3EsqkABAEMi/tYUkCnfaOF5BRqdSShI+NKNNPE4cr0c=;
 b=Tyb2bnXJ9KvhV0l3l/56wgmtFT89lmv/XZlHicDxSgdKBpPzZMo43oH1JDgeXiaEH3l9
 8xls9gBgnJ19sTQ2ewsjAFYK7M0/ZEZi9gTX0slKp83TfNx7bF3R57sDg17oLxUpmX6l
 jYDWTEv5LHl/apHWffp16nTwxp38UXW71O0= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 34f7pjhc71-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 29 Oct 2020 12:27:21 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 29 Oct 2020 12:27:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBf0rS4q4KyKB5u596SRIWIo3sZHjOZt7JPJfWf6OrzYFng3SnDOGn5uCokr/NE0tOAYPLy51hEf/owunef8t7jVXkC8LAuxmPuQmINvGpLbxif2ZHlJVM97tafM61KLwhqNSS+XVn8wPN44Y7m/9+AXxfXeB0K3u9Sed0pvSnuoKpgmOsxIaKG3D4hgoMU7hi0rOKCRs1rb92qu2SBJS4QBsCZvJfT3w4slJ0dpaCBjsN/E6w4lu97A9L5urQ1M0OS85RkQVf4VEfU6BmcH4poaS8Kl8d4cgNK00Nxjase4f7LsldIgqWfkGmFz4sjiSLlCogut22RXUb/2r+aSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EsqkABAEMi/tYUkCnfaOF5BRqdSShI+NKNNPE4cr0c=;
 b=BUzlVfoGxLGnIQ/h0MDNRj0KYJlY1WxbVSyV+8EvkMIqMbs3yJsuqSU5ldhy766B4J9G2GHOYid2Mj/ZyTqHBdc3kMESQeD0xp1uvRu1NxsfRWxzsjyyt+UQnEPnA9gq3W20yz/Sk93oI/ZJsdo0KBy/FK1IWXY/MOtA95RlioPpOWgE0MJyPAzzAjkPC9viOWTBGwsJG7LgHWdATHSNKbJJLnf2xN+3G5M859fhFc3YkhaOJUI72hJHanSCupO7lL4PyvhRh8wyz/L9949NV4L4kgejvqRXLLdwG6krJTXxSvR1gOfSvv6MuJioR6n167wIPRKLk4WcpIdr+rvIKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EsqkABAEMi/tYUkCnfaOF5BRqdSShI+NKNNPE4cr0c=;
 b=aXBtpxoITwURbTEAow/ypI+ciTn97wg9+wByhWrRg4SFYsd3NEVR+/jwD0LhCDsor9gmUbwzF2hNgAF12gosFJKqNZVNu/6ecoYZ7VlcUx4xDy97vYEnb/qgNuzBTD2XjHUUlNUC9ecXkyzzhFdiZh0wCeK5rBNlczrK7/o7xZQ=
Received: from BY5PR15MB3537.namprd15.prod.outlook.com (2603:10b6:a03:1f5::20)
 by SJ0PR15MB4170.namprd15.prod.outlook.com (2603:10b6:a03:2c9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 29 Oct
 2020 19:27:15 +0000
Received: from BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a]) by BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a%5]) with mapi id 15.20.3477.029; Thu, 29 Oct 2020
 19:27:15 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Voelker <Patrick_Voelker@phoenix.com>, "OpenBMC
 (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: Re: Using local git repo for recipe development
Thread-Topic: Using local git repo for recipe development
Thread-Index: AdauFs6ToZT99Bk/To2jUGwd1837nv//sAwA
Date: Thu, 29 Oct 2020 19:27:15 +0000
Message-ID: <42E14EF0-5851-4223-A3A5-07DC8837EF29@fb.com>
References: <0bf9e810dbce40bf90d96a4d39e55d68@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <0bf9e810dbce40bf90d96a4d39e55d68@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: phoenix.com; dkim=none (message not signed)
 header.d=none;phoenix.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:92f7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 835b0cf2-9c4d-43a8-40d9-08d87c40a4a7
x-ms-traffictypediagnostic: SJ0PR15MB4170:
x-microsoft-antispam-prvs: <SJ0PR15MB4170FA107F25AB53EDEAE705DD140@SJ0PR15MB4170.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lacRfQju2yYXabKaqTTAmhQR3byjhZQQnIb1x6uyAUflhi8WjwrfOjd9DT69nCmGeaP7Oxv2cSSmnpu41NELQy0Ykj3OThmZi4djDVWeuebgtwVskFAbEbE2oUmFSlnhn9QAQ+inVLOjDaERmDvTm6sEiYT2EhNLWJ6AFNmrqBy3ATJIgS1GaV2AnZ3vxyrpMckAWyeI+mrGDRc2ZQV09AusGx4KKMUf4XLzBTiewwLESXazGO9ATGtCkrEPrCt2U2ydQqEPNa/diEjQNyz+pb3mC5IsRP4CgZzSMUDQkEW3CaDcDvmX7vnjoBNlECBoHz2llN/wiewb9ELtBX4t6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3537.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(346002)(396003)(366004)(39860400002)(110136005)(2906002)(36756003)(5660300002)(186003)(2616005)(478600001)(6512007)(8676002)(316002)(8936002)(86362001)(33656002)(6506007)(66446008)(71200400001)(6486002)(66946007)(76116006)(64756008)(66556008)(66476007)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: yiBSVIyk9BeMz712cHhmicJj/lVEJmnHLinTEUgXPy0F14BfpNqX8xIsV02elU4fVIxMenJcEFgWkHadnAZGSWC8Adnkx8AN4MTPOJbsyeFbfjDOmH7sYD2ug8coqAHuoROCRJeYw+kSbZjJBh7bnhtfKDpAI3sEoVvoVT0igEeZnuzD+LVjCSNxJaAmBZ+oUpUxGLBVKoXyhLxzZluj8jSVRd6lKEjoeMCqakJnpdJrscx+NSTjwNRCsAeoE5r31txPB97bvm7LK/BTRdAKYOGfV4B8YxP8tJJ24yPJyZehfMql4K8Um/QNdPrfNkc66XQmR1mKtg8/QeRfxvtg1/To9K3MglFb2f2ELj3zXxBk+3LnKdT2DReDfjgRWGbDUmeJI7tV0T/Kz+Yarey+iROGydPRKwGYTGDAN/ahp/BfTfYmH45wAiPABUcuz+A2r+4ssWfccUEriedWrVnWFTd0M1XpXdL560jkd6Xt12B0KCJeSduc944ZUinAOzfAmcUxj9CY9xQLOmwHGpnVLlkIMYukEpnUSEtr2cr67KPJfiPc9Bifaw1sxrQpzdEH+RpMxJ+uKlYseESxX46nmMOAyKxtyfbC/Dz0fIy2+ZK1QuZwN6tMdSS1qQhZeASHRX6CsEwWQ92fbJrX/iwH80U/sSMzCYmpurntGqj5OYfwq6gxpQpGqSJMRZ2JR05P
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <85F5662695733E49B9E2E3AB514DEBC8@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3537.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 835b0cf2-9c4d-43a8-40d9-08d87c40a4a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 19:27:15.3571 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9nojoh25iTIAU+eyhzd3RvzU2urXE9sRJLC6HZShD8DfiPQafGUuOyIfXAwhq8NSQFdEw8Uy0oADsZOwlSPVWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4170
X-OriginatorOrg: fb.com
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1015
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010290132
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDEwLzI5LzIwLCAxMDoxNyBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIFBhdHJp
Y2sgVm9lbGtlciIgPG9wZW5ibWMtYm91bmNlcyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3ps
YWJzLm9yZyBvbiBiZWhhbGYgb2YgUGF0cmlja19Wb2Vsa2VyQHBob2VuaXguY29tPiB3cm90ZToN
Cg0KICAgIEknbSBjcmVhdGluZyBhIG5ldyByZWNpcGUgZm9yIGxvY2FsIGRldmVsb3BtZW50IGJ1
dCB3aGVuIEkgZG8gYSAnZGV2dG9vbCBtb2RpZnkgPHJlY2lwZT4nIGl0IGFsd2F5cyBzZWVtcyB0
byBtYWtlIGFuIGVtcHR5IGRpcmVjdG9yeSAodGhhdCBjb250YWlucyBvbmx5IC5naXQuKSANCg0K
ICAgIEhlcmUncyB0aGUgcmVsZXZhbnQgbGluZXMgZnJvbSBteSAuYmIgZmlsZToNCiAgICBTUkNf
VVJJID0gImdpdDovLy9ob21lL3B2b2Vsa2VyL2JtYy9kZXYvb2VtO3Byb3RvY29sPWZpbGUiDQoN
CkkgYW0gbm90IHRvbyBzdXJlIGJ1dCB0aGlzIHNob3VsZCBiZSBmaWxlOi8vLCBZb3UgbWF5IGhh
dmUgdG8gZml4IGFib3ZlIGxpbmUuDQoNCiAgICBTUkNSRVYgPSAiNGRiMTdmNDgyYjBiZGNkY2Y1
NjU4YzdkMzIzY2M1NjNlYjc4NTU2YSINCiAgICBpbmhlcml0IGF1dG90b29scw0KDQogICAgSGVy
ZSdzIHRoZSB3YXJuaW5nIGZyb20gJ2RldnRvb2wgbW9kaWZ5JzoNCiAgICBXQVJOSU5HOiBObyBz
b3VyY2UgdW5wYWNrZWQgdG8gUyAtIGVpdGhlciB0aGUgcGhvZW5peC1vZW0gcmVjaXBlIGRvZXNu
J3QgdXNlIGFueSBzb3VyY2Ugb3IgdGhlIGNvcnJlY3Qgc291cmNlIGRpcmVjdG9yeSBjb3VsZCBu
b3QgYmUgZGV0ZXJtaW5lZA0KDQogICAgSWYgSSBjaGFuZ2UgZWl0aGVyIHRoZSBTUkNfVVJJIG9y
IHRoZSBTUkNSRVYgdG8gYmUgaW52YWxpZCwgSSBnZXQgYW4gZXJyb3IgaW5zdGVhZCBvZiBhIHdh
cm5pbmcgc28gaXQncyBkZWZpbml0ZWx5IGZpbmRpbmcgdGhlIGxvY2FsIHJlcG8uDQoNCiAgICBJ
IGNhbid0IGZpZ3VyZSBvdXQgd2h5IG5vbmUgb2YgdGhlIGZpbGVzIGluIG15IGNvbW1pdCBhcmUg
bWFraW5nIGl0IGludG8gdGhlIHVucGFjayBkaXJlY3RvcnkuICBBbnkgaWRlYXMgb3IgdGlwcyBv
biBkZWJ1Z2dpbmc/ICBJIGFsc28gdHJpZWQgdXNpbmcgIGEgLnRhci5neiBmaWxlIGluc3RlYWQg
b2YgYSBsb2NhbCBnaXQgcmVwbyBhbmQgaGFkIHRoZSBzYW1lIHJlc3VsdC4NCg0KDQo=
