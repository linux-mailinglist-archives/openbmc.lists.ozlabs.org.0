Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1139419A006
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 22:40:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sLmq2ksyzDqx4
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 07:40:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=135935d244=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=GLLpCrm4; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=aGpMh7BN; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sLm068N5zDqVR
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 07:39:27 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VJv6tj015789; Tue, 31 Mar 2020 12:58:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=5VDEchpuLrjewwTJaGO2Yqm+aTn3Vl3ZZpA/UChDrAw=;
 b=GLLpCrm4OM8aLeA7InY5eYH2CW9cxyP26GVCFHx85GZ6R2nPHInpEp45ovauGpm7XACU
 VysTvn+bYHB+/v1RgOzT8PH+U+w+fst3i3qtxRs3vi+HscqeivUGJM9Z+IhIjBX9vZfr
 4XAWyOjFO5Cwy03eiRWgmmF9J9IUg+B7Lq0= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 303dtb2f6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Mar 2020 12:58:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 31 Mar 2020 12:58:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=br6aSwUGBXsekjYqvh6BPaOvjoOvnLhOTcqW03JeOiv3zDSZgQO2yRIaw+zq0m43emJaJADbpkvTGRMIG1cVzhEd0J1aSVb9rF/bQ6Kd7223hncbMNhkDemjVz6NyTAe10JmnVlvNHkMmmOvLNgiFsrJheXSpTRQOFRmZDH8pXt4sofmyyQwS10NNAUq4OMmk2zgfamI3mZ8D9JcP9PDHS5I84MiIi6iKng7AZFjwuEe3k2e9iDnthcEisgOdcXEv5pKbQQA2r124f2gjF//ZrOUDsx+CofNZWmmfkKPedv0W1xJaK2M6F3OKAf6RoDMwIJjNfhO7vJNShnloyd0Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VDEchpuLrjewwTJaGO2Yqm+aTn3Vl3ZZpA/UChDrAw=;
 b=AoHfPfcNdsu/2dGQclvYrfxQMZ0mRQcNLfbLvO2jD5NV/WawgwOicDsn57EHj79m0yuIXI0CfBtEiFU7Y//XhJa51EZwQDg84K/quPbfICGz0lZdnSLVGcbW8AbbVKGOpmy467RfeyO5sfMGEip8c9YnIsMLOnmEu9n5trgzsKzIxVQhG0GOD4TlbAM9l7D3jqNfAfaqUY4OfU5dTLS7eZBPHGc81EpLmTF9jRj4APtU3B2TXgeg1ZKX74HlLE2o0E0nNFEVI6teYScu/iq3rrHTcxYRzjMCbh524i+2Ph2O91TbzkgjaNOqRChZuvb9tARxW+CKTKGYwqVuQTBlOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VDEchpuLrjewwTJaGO2Yqm+aTn3Vl3ZZpA/UChDrAw=;
 b=aGpMh7BNYbgNvA67pcigvyx9C58dqOzHQWJDQEfBSKbAJ84PjcbVvnIZepq45lr4NYkTPiOpnaYD7WzyI5QLen7vK8s9zXN7WEihElWugrWUN6mFDGFGf76Fu2mk5OnzkJYZ3yt5dTrEnvhshjwK7WOoZgbFJrjjLVJBGBIJ8uk=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3977.namprd15.prod.outlook.com (2603:10b6:303:4d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Tue, 31 Mar
 2020 19:58:40 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 19:58:40 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: New repos request
Thread-Topic: New repos request
Thread-Index: AQHWA6o9emMK5/O3gUivoy5bU+uBE6hi3fkA//+h0ACAAJ92AP//kZ6A
Date: Tue, 31 Mar 2020 19:58:40 +0000
Message-ID: <53BBA343-A673-4762-997A-47A26EA1EF36@fb.com>
References: <7388c9a0-20da-a9a2-af08-76d3e4aca4f1@linux.intel.com>
 <56BA4944-EF73-40E7-9E16-35A327A2DC9B@fuzziesquirrel.com>
 <723777DD-6CF7-4C46-B79D-BE2AAF66C693@fb.com>
 <da673369-58c1-e64a-72ac-75283ae3c7fc@linux.intel.com>
In-Reply-To: <da673369-58c1-e64a-72ac-75283ae3c7fc@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:51f6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f1abd4e-1f15-413c-7475-08d7d5ade8ca
x-ms-traffictypediagnostic: MW3PR15MB3977:
x-microsoft-antispam-prvs: <MW3PR15MB39770BA04FEF8B52333989EDDDC80@MW3PR15MB3977.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(39860400002)(346002)(376002)(136003)(366004)(3480700007)(8676002)(8936002)(81156014)(86362001)(81166006)(2616005)(316002)(110136005)(478600001)(36756003)(6486002)(186003)(66946007)(7116003)(6506007)(71200400001)(66446008)(66556008)(2906002)(66476007)(33656002)(6512007)(5660300002)(53546011)(64756008)(966005)(76116006);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JZIRI6oJA1teFMfK/EdLzsqdB90pa52biaMfEnvgMF0LSLhZdcIeNfEqV51CEmcpshKJE0RroSXxXOrfDXMeLu0coS8/Hznkhwg1Z6REuOK3azsRYV0PZL02Tq7vyHm7kB/9WR7U3o3COh8r43vfaE1Y+TT894aA/OGzN4xBtsSITNkb5aLHATCVZ6CjLjtdYo1WwNUe7e6Tvi184w7kwDtSUAFyqJwsXpdasvLhmqNhJRIXYtBeO662zI4yZQ5O5NRYN4bgkdFhYfN5rhqL+oT+HD/5AUeWYQ6+V+3qFCJJ29swbpi6/RK2Nyr3hu8HDjcQIMzWPPmxBWIKJn16vXtH4Uw3PuLq25KmonFMnp92tjIXgfFLYYKstXRj852NwioHB+vlXLyU3zbYJdisOyMpQC29Ptxj44pfwUt35rZittpEf1OZfzjCq3afocCUh9v3ffDFlFrS24EOxmcM2I1hlIJ9Oe87ZN/kJ4k7vgGuJABKJ6Jbmswqq5vO4SXKIgKSenFtr3RfkbgBu1oK8g==
x-ms-exchange-antispam-messagedata: O6uSdWAHF3AX1cK1tb148cR3/K5lDm2VEulR46mNV61ZnLcKHTHHemSANxMr9P+SJA+fIFhuSJQ2rkEpwGBADhQuwUA+b0fvYvBc4dWYSrO5yx6ukh+hKlknG5Hqs409jyr4j/m6QvLTcI+oydWLNQpDSFxwtp7+2E1yu6T/dxmke/HDxUgvRI9C+iXuhvbd
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7DCEB5FC230B144D8CCBD8701F71A14D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f1abd4e-1f15-413c-7475-08d7d5ade8ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 19:58:40.6819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RFpvgkXeNeOl5iORBvIPW9pVOR4xBhGnAVX/8JELFq3kXGleBWCQ4+2FXXUclk9KQrCvTjbvwTSIvXyT8oWwWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3977
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 mlxlogscore=595 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003310165
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

DQoNCu+7v09uIDMvMzEvMjAsIDEyOjM0IFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQmlsbHMs
IEphc29uIE0iIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFi
cy5vcmcgb24gYmVoYWxmIG9mIGphc29uLm0uYmlsbHNAbGludXguaW50ZWwuY29tPiB3cm90ZToN
Cg0KICAgIA0KICAgIA0KICAgIE9uIDMvMzEvMjAyMCAxMDowMyBBTSwgVmlqYXkgS2hlbWthIHdy
b3RlOg0KICAgID4gSGkgSmFzb24sDQogICAgPiBDYW4gd2UgZ2V0IHNvbWUgZGV0YWlscyBhYm91
dCB0aGVzZSByZXBvcyBsaWtlIGZlYXR1cmVzLCB1c2FnZS4NCiAgICBTdXJlLiBJIHdpbGwgdXBk
YXRlIHRoZSBvbmVzIHRoYXQgSSBrbm93IGJlbG93IGJ1dCB3aWxsIGhhdmUgdG8gZGVwZW5kIA0K
ICAgIG9uIG90aGVycyB0byBhZGQgbW9yZSBkZXRhaWwuDQogICAgPiANCiAgICA+IFJlZ2FyZHMN
CiAgICA+IC1WaWpheQ0KICAgID4gDQogICAgPiBPbiAzLzMxLzIwLCA4OjQ1IEFNLCAib3BlbmJt
YyBvbiBiZWhhbGYgb2YgQnJhZCBCaXNob3AiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9
ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24gYmVoYWxmIG9mIGJyYWRsZXliQGZ1enppZXNxdWly
cmVsLmNvbT4gd3JvdGU6DQogICAgPiANCiAgICA+ICAgICAgYXQgNDowNSBQTSwgQmlsbHMsIEph
c29uIE0gPGphc29uLm0uYmlsbHNAbGludXguaW50ZWwuY29tPiB3cm90ZToNCiAgICA+ICAgICAg
DQogICAgPiAgICAgID4gSGkgQnJhZCwNCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+IFdlJ3Jl
IGRvaW5nIHNvbWUgaG91c2VrZWVwaW5nIGFuZCBoYXZlIHNvbWUgY29kZSB2YXJpb3VzIHBsYWNl
cyB0aGF0IHdlJ2QNCiAgICA+ICAgICAgPiBsaWtlIHRvIG1vdmUgaW50byBnaXRodWIuY29tL29w
ZW5ibWMgcmVwb3MuDQogICAgPiAgICAgID4NCiAgICA+ICAgICAgPiBJJ2QgbGlrZSB0byByZXF1
ZXN0IHRoZSBmb2xsb3dpbmcgZm91ciBuZXcgcmVwb3MsIGlmIHBvc3NpYmxlOg0KICAgID4gICAg
ICA+IGhvc3QtZXJyb3ItbW9uaXRvcg0KICAgIFRoaXMgYXBwbGljYXRpb24gd2lsbCBtb25pdG9y
IHZhcmlvdXMgR1BJT3MgYW5kIHNpZ25hbHMgZnJvbSB0aGUgaG9zdCANCiAgICBhbmQgdGFrZSB0
aGUgYXBwcm9wcmlhdGUgYWN0aW9uIHdoZW4gdGhleSBhcmUgZGV0ZWN0ZWQuICBGb3IgZXhhbXBs
ZSwgDQogICAgbG9nIHRoZSBldmVudCwgY2FwdHVyZSBhIGNyYXNoZHVtcCwgZXRjLg0KDQpXaHkg
Y2FuJ3Qgd2UgdXNlIHBob3NwaG9yLWdwaW8tbW9udG9yIGZvciB0aGlzLiBJbiBteSB1bmRlcnN0
YW5kaW5nLCBwaG9zcGhvci1ncGlvLW1vbml0b3INCmRvZXMgdGhlIHNhbWUuDQogICAgDQogICAg
V2lsbCBiZSBwb3J0ZWQgZnJvbTogaHR0cHM6Ly9naXRodWIuY29tL0ludGVsLUJNQy9ob3N0LWVy
cm9yLW1vbml0b3INCiAgICANCiAgICA+ICAgICAgPiBsaWJwZWNpDQogICAgVGhpcyBpcyBhIGxp
YnJhcnkgdG8gcHJvdmlkZSBhbiBpbnRlcmZhY2UgdG8gdGhlIFBFQ0kgZHJpdmVyLg0KICAgIA0K
ICAgIFdpbGwgYmUgcG9ydGVkIGZyb206IA0KICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9JbnRlbC1C
TUMvcHJvdmluZ2dyb3VuZC90cmVlL21hc3Rlci9saWJwZWNpDQogICAgDQogICAgPiAgICAgID4g
cGZyLW1hbmFnZXINCiAgICBXaWxsIGJlIHBvcnRlZCBmcm9tOiANCiAgICBodHRwczovL2dpdGh1
Yi5jb20vSW50ZWwtQk1DL3Byb3Zpbmdncm91bmQvdHJlZS9tYXN0ZXIvaW50ZWwtcGZyLW1hbmFn
ZXINCiAgICANCiAgICA+ICAgICAgPiBzZXJ2aWNlLWNvbmZpZy1tYW5hZ2VyDQogICAgV2lsbCBi
ZSBwb3J0ZWQgZnJvbTogDQogICAgaHR0cHM6Ly9naXRodWIuY29tL0ludGVsLUJNQy9wcm92aW5n
Z3JvdW5kL3RyZWUvbWFzdGVyL3NydmNmZy1tYW5hZ2VyDQogICAgDQogICAgPiAgICAgID4NCiAg
ICA+ICAgICAgPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IGhhdmUgYW55IHF1ZXN0aW9ucy4g
IFRoYW5rcyENCiAgICA+ICAgICAgPiAtSmFzb24NCiAgICA+ICAgICAgDQogICAgPiAgICAgIGRv
bmUhDQogICAgVGhhbmtzLCBCcmFkIQ0KICAgID4gICAgICANCiAgICA+IA0KICAgIA0KDQo=
