Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C47D270DFB
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 02:13:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45szTw1R57zDqCM
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 10:13:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=210739c354=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="p9gzi+Ue"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="MqB41vf0"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45szSm6McczDqGv;
 Tue, 23 Jul 2019 10:12:37 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MNvdBf028614; Mon, 22 Jul 2019 17:12:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=47yA3S/dn29pU210jxpIjgIIPluX08lJUPMgAazE9QE=;
 b=p9gzi+UejOLcKCbxkUQcdhaE2rthflpt1i9H6VvfROE0LUBrAbX70C0UBUzcebJRgyg4
 0UZobudpvw0GS2FcH1MfSldKQD/RtF2OMTZht159tQMECr12aYqC0iIgKAkMYApCxkxp
 ZJQAvf/eTjd7CiLOGGsNgcGxxBHY6JIp7lw= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2twgue1ja2-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 22 Jul 2019 17:12:15 -0700
Received: from ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) by
 ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 22 Jul 2019 17:12:14 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.175) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 22 Jul 2019 17:12:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkIfvk2HXsR754ci+YtMzdRWUl94btKXHOETQsDoltf8WuaxIpyAMzXUOMlol3a//GxAHJGaf4uPB+Guxjg6btnxkxZ/alqcXDGXNTlJUsJRpiH/4eliOTsO0B84alYeLc2cw+jUxQZlN4+JBtWNC14EKgV0Dsq+2Cd5v3NOXGZGUajrK7M6c5v9/lJJalS3zlolurMU3hJZdP8bk3l8vYDck0Emoqb3HdcQElWUm3HKSWXVBhXeGStZzRbZW6szy7jC+mIMx61XUfEs+uEl5cfQ62FSZuICqOJ9hPzlEW9w6xinkq+5phAZe1ZQnWR/K9OXEqgTBXGhzdls3JngHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47yA3S/dn29pU210jxpIjgIIPluX08lJUPMgAazE9QE=;
 b=RprmohRoSaKvDS2M7Ezv7UG0Hh08WRn14RJcYyg7XdjiYZKu/aHp1Q8LaxrkZ7LbilcJ8Ls3zGmvtJsQVGA1bLA5P+r3FM0ZqAxImqqLr3M0wATz6+jFBiJdVEdVC2avv73H2fSXcBCHrF6YdRgxIbSdYYcIDBLJ/H1NNdxuiC3w24o88VRAdwVPMzYsWyo6nDkbGi4GnG+lhvqFP18dCVNKbudj8lhc7Vq2xTp4iPOEZYv/Egg8ej6JAhCZzjnWigaoUhOHtnJWPsQucRhYtDcnT11g4tUqbP7umlCdrRyh/gdxx9pY9bsRFCySchB9pJAxao2+qQxwtMmhgOQzYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47yA3S/dn29pU210jxpIjgIIPluX08lJUPMgAazE9QE=;
 b=MqB41vf0w5n92+9DxZK4SeZkQ0to95l3sVTXwPr2Krg5yIQd8sWQMCwPvjcTRX/68Npkew8ep4cmw9uieO6vp/1A971+OvdwsmKqTY4D/RBlbT+1f9uzugyYWQjhEKG3v7uXSsCZelsGrYtPKNlfhLb/uIsaLXLuSsJG8rL1Als=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1942.namprd15.prod.outlook.com (10.172.182.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Tue, 23 Jul 2019 00:12:13 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::fce3:df83:1cbf:e65e]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::fce3:df83:1cbf:e65e%12]) with mapi id 15.20.2094.013; Tue, 23 Jul
 2019 00:12:13 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] dt-bindings: hwmon: Add binding for pxe1610
Thread-Topic: [PATCH] dt-bindings: hwmon: Add binding for pxe1610
Thread-Index: AQHVQMj6YyK+RzecrU+D/iqZ3uEb46bW36IA
Date: Tue, 23 Jul 2019 00:12:13 +0000
Message-ID: <6E2B35D8-B538-4C96-B289-27A87ECD74DB@fb.com>
References: <20190722192451.1947348-1-vijaykhemka@fb.com>
 <20190722192451.1947348-2-vijaykhemka@fb.com>
 <20190722200622.GA20435@roeck-us.net>
In-Reply-To: <20190722200622.GA20435@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:693e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02afd42f-c990-4c74-7fc3-08d70f0269d0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1942; 
x-ms-traffictypediagnostic: CY4PR15MB1942:
x-microsoft-antispam-prvs: <CY4PR15MB19428E40EF730709D0B269AADDC70@CY4PR15MB1942.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(346002)(396003)(39860400002)(136003)(199004)(189003)(11346002)(446003)(6116002)(6436002)(36756003)(46003)(476003)(2616005)(53936002)(6486002)(186003)(102836004)(33656002)(478600001)(14454004)(25786009)(256004)(486006)(64756008)(71200400001)(81166006)(6506007)(7736002)(91956017)(316002)(6916009)(305945005)(71190400001)(4326008)(99286004)(8676002)(6246003)(86362001)(66946007)(54906003)(66476007)(5660300002)(2906002)(76176011)(6512007)(229853002)(7416002)(8936002)(66556008)(76116006)(68736007)(66446008)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1942;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KFz/LP6D4YVMw6XODKGTCD6azywLpEE/Bs5H41lgOMOTNQBhMyCRzqGKxas4YEhfsNO4JwNkAYsAi+UsO1V2VIuETfvZiS1u/hNi82s5QEVt4V3DyAOV6xMOFgSNxTyT7oDJ9IeT4M9UYhNW/prV1UbEKC3KSyvP/kx4PU6dp2ufq4A/jVglUbQGVMTVI2KODfX0/qltoTZ77Tc6vBBfH7oFxFfreLGlTQj0vJdAM9Nj5xg7jyH8JQhh2p8GPwRiC2evfANyXtqEv6zwgYErRfzQ+GeAAg970Ebb0r9Elbqd+Nu2HXZa2/3fJ3t0OgCn+pjReX2LSo/2seFEqg7zfEPnVhTNnbS0Y2Fa0pUwuYqZJRXmrd4ALzshMZf5pXMGVJUkEHQSqVB7JT3oG5W7dFWu/Zm+0PjzOzZNabmbcgE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A0644FACC1CCC41A9BAC7C4FFF2F7F5@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 02afd42f-c990-4c74-7fc3-08d70f0269d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 00:12:13.4148 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vijaykhemka@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1942
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-22_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907220252
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDcvMjIvMTksIDE6MDYgUE0sICJHdWVudGVyIFJvZWNrIiA8Z3JvZWNrN0BnbWFp
bC5jb20gb24gYmVoYWxmIG9mIGxpbnV4QHJvZWNrLXVzLm5ldD4gd3JvdGU6DQoNCiAgICBPbiBN
b24sIEp1bCAyMiwgMjAxOSBhdCAxMjoyNDo0OFBNIC0wNzAwLCBWaWpheSBLaGVta2Egd3JvdGU6
DQogICAgPiBBZGRlZCBuZXcgRFQgYmluZGluZyBkb2N1bWVudCBmb3IgSW5maW5lb24gUFhFMTYx
MCBkZXZpY2VzLg0KICAgID4gDQogICAgPiBTaWduZWQtb2ZmLWJ5OiBWaWpheSBLaGVta2EgPHZp
amF5a2hlbWthQGZiLmNvbT4NCiAgICA+IC0tLQ0KICAgID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2h3bW9uL3B4ZTE2MTAudHh0ICAgICAgICAgfCAxNSArKysrKysrKysrKysrKysNCiAgICA+
ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQ0KICAgID4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vcHhlMTYxMC50eHQN
CiAgICA+IA0KICAgID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9od21vbi9weGUxNjEwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9od21vbi9weGUxNjEwLnR4dA0KICAgID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCiAgICA+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uNjM1ZGFmNDk1NWRiDQogICAgPiAtLS0gL2Rldi9udWxsDQogICAg
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vcHhlMTYxMC50
eHQNCiAgICA+IEBAIC0wLDAgKzEsMTUgQEANCiAgICA+ICtweGUxNjEwIHByb3BlcnRpZXMNCiAg
ICA+ICsNCiAgICA+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KICAgID4gKy0gY29tcGF0aWJsZTog
TXVzdCBiZSBvbmUgb2YgdGhlIGZvbGxvd2luZzoNCiAgICA+ICsJLSAiaW5maW5lb24scHhlMTYx
MCIgZm9yIHB4ZTE2MTANCiAgICA+ICsJLSAiaW5maW5lb24scHhlMTExMCIgZm9yIHB4ZTE2MTAN
CiAgICA+ICsJLSAiaW5maW5lb24scHhtMTMxMCIgZm9yIHB4bTEzMTANCiAgICA+ICstIHJlZzog
STJDIGFkZHJlc3MNCiAgICA+ICsNCiAgICA+ICtFeGFtcGxlOg0KICAgID4gKw0KICAgID4gK3Zy
QDQ4IHsNCiAgICA+ICsJY29tcGF0aWJsZSA9ICJpbmZpbmVvbixweGUxNjEwIjsNCiAgICA+ICsJ
cmVnID0gPDB4NDg+Ow0KICAgID4gK307DQogICAgDQogICAgV291bGRuJ3QgaXQgYmUgYmV0dGVy
IHRvIGFkZCB0aGlzIHRvDQogICAgLi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dHJpdmlhbC1kZXZpY2VzLnR4dCA/DQpTdXJlLCBJIGRpZG4ndCBrbm93IGFib3V0IHRoaXMgZmls
ZS4gSSB3aWxsIGFkZCBhbmQgc2VuZCBhbm90aGVyIHBhdGNoLiBJdCBpcyANCkRvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy90cml2aWFsLWRldmljZXMueWFtbC4gSG93IGRvIEkgYWJh
bmRvbiANCnRoaXMgcGF0Y2ggb3IganVzdCBsZWF2ZSBpdC4NCiAgICANCiAgICBUaGFua3MsDQog
ICAgR3VlbnRlcg0KICAgIA0KDQo=
