Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0B7B9705
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 20:14:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Zhh04mSQzF3gd
	for <lists+openbmc@lfdr.de>; Sat, 21 Sep 2019 04:14:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=4166b91f42=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="DB8RS5fx"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="cM1FTghD"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZhgG2HlgzF3f0
 for <openbmc@lists.ozlabs.org>; Sat, 21 Sep 2019 04:13:57 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x8KI93eW009375
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 11:13:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=facebook;
 bh=oV/52U7DxhCJgHaQWa6ImnDdg0FA1ETkay3U/VWVjKQ=;
 b=DB8RS5fx9MV+EgVoOqUdjc6eszBmW/QyhPjmAom/qrrBTx87VL5Yl3obwAQ7cNYSIGZH
 vykvkDFw8Gi/pvWvdF+1wN6el6U4d0rjR9r3hlTVAE2GfyyDsrvfwCy4UEka7OJHrxKX
 4KkidsHzIDqZ2Wd6pYr4SDT9+EDudbDN9dM= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2v516j0ucq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 11:13:54 -0700
Received: from prn-mbx03.TheFacebook.com (2620:10d:c081:6::17) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 20 Sep 2019 11:13:53 -0700
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-mbx03.TheFacebook.com (2620:10d:c081:6::17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 20 Sep 2019 11:13:53 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 20 Sep 2019 11:13:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esiI51ljp0atcZirn9FHYaTHaOv0+L/k5N/5rvVThhMEQvv8EgtJdFIzBaqTomVgF95tZ7bnT9F/x1/cUH21spk/+Afb4yUBYD8EpMuKrnZ73yY2huDbGCvYrh+Y8SDYdJkAHFjKUejQLTBCWYEMDystoEkR+Q88UtuTSJ3g3GBWTsDwaIFdtguNGgxSQAyWK5teosbyOss2I8j+WiX0UxgAVc7uhWgPVR11v1eJriYI1mU2vjWC4XYtfIu+YHd7Hro+nrHWVVWflQbrkZG4eTjFmyqFZNSu13pnFa5/n5tgXzyaIEoD9qNH12yWj48DzEAyRa7vagdK5XRSyZVUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oV/52U7DxhCJgHaQWa6ImnDdg0FA1ETkay3U/VWVjKQ=;
 b=Gwr2jnKhmvMmiUt8rLO1y0hJtY9muqSxumcNc6LNtwB1vmFPF7YkPuQFpxvFt1n9/WzH1cgVxDUa4E38Zxjw60fr5Td0XhT22sX/fx5v8Jv3n9LPQj2oTmHecKl0Yn8NK41S7l5r8b/K2sHmQTZ7kmPwl4omsKlKPDFAXn7nB+NI3U4K2cObElzCpqRbycqOyM96mEKNk8yvOtjNuyKtOsVCQ/dLwyYCsunaTJPJSYQeZt3l8dJFynFvpoQ+X6BSHosn16lIVzrqyZZ6Q7s2fvgYv92rXnzKtKWcFdAUAdH++p2b0PHuHG7sL4lZj9PeOYwXdkVVy+MB6a0nQUhlWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oV/52U7DxhCJgHaQWa6ImnDdg0FA1ETkay3U/VWVjKQ=;
 b=cM1FTghD1H65SmufolpAV4HPZN2sVjJrjgKYSrgDSwxQoDRsQXSvqvw2PnW1/gEMFhYxSGorH2rP4osq1qcGHBLOxhR/YL12Nw2jbDopniSm+QwFxahY+i/dGvsMSEmz+lWNCp/RqhvUH7aHWrSuRSkNrMYKkr8JCixlmXcK9hw=
Received: from MWHPR15MB1823.namprd15.prod.outlook.com (10.174.254.147) by
 MWHPR15MB1694.namprd15.prod.outlook.com (10.175.141.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Fri, 20 Sep 2019 18:13:52 +0000
Received: from MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432]) by MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::c938:1e2c:dc9f:6432%6]) with mapi id 15.20.2284.023; Fri, 20 Sep 2019
 18:13:51 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Utility Error Output
Thread-Topic: Utility Error Output
Thread-Index: AQHVb98ok3nv1cEtgEmm7SmcaDw9qQ==
Date: Fri, 20 Sep 2019 18:13:51 +0000
Message-ID: <5F2FBA2B-BBE9-4D89-AF0A-80493A4A68E0@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:450a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e52571b4-9d85-4ded-f020-08d73df64a9d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1694; 
x-ms-traffictypediagnostic: MWHPR15MB1694:
x-microsoft-antispam-prvs: <MWHPR15MB169451D09745C171FEEB8A6ABD880@MWHPR15MB1694.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0166B75B74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(366004)(39860400002)(376002)(136003)(189003)(199004)(7736002)(66476007)(2501003)(5640700003)(6436002)(6512007)(14454004)(478600001)(256004)(81156014)(33656002)(66446008)(2906002)(4744005)(66946007)(486006)(81166006)(64756008)(99286004)(6486002)(6506007)(76116006)(36756003)(7116003)(86362001)(66556008)(305945005)(2351001)(3480700005)(25786009)(476003)(46003)(5660300002)(6916009)(6116002)(186003)(2616005)(316002)(1730700003)(71200400001)(71190400001)(8676002)(102836004)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1694;
 H:MWHPR15MB1823.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: S+QCFilZf1UJHVCQdA9dukj+rNs1hkT4KWVReguT7zyiaC3eXy21Xdgf7cOoMyLFRsc0zrxtdGJIJdGnriti3uZ5NTA+VJwAkszZOnEavzRgmmRIrxq8MQtXZH+dC0FMXwkGkeClCH6pRFQ7ugLrJDZgdgLNGo3tg7w/YBVtkBOwoUOL7y6PtLFXUEly5yk3kJCEFLepNgzE+y3w4PWEjn/H1piNFmQDqgbY/fPKHxDit02/kL2Zi1F5NbpRJept4nr0jIjcWdBrj6CJjfyQN086HleDLopQiNkb7Znv2mvKSUiL7hyVxbvQcE6CrjXAzt/FzxVlP/gbx5HrkxzrJjtNgfD1+ljl8CSJEOVCzIER7W3ExI9G8o3MyROPBeIxFSYasdQo+eJ/8ATg715VGKweu59VNjWD67tFC7rt5Ys=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CADC55F3EE186418F1E64F33838E51A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e52571b4-9d85-4ded-f020-08d73df64a9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2019 18:13:51.7459 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QBRlwWUwHwI4Bz759LuI3j98QhKAwWOqmnHWijGia/GnDtGHtGjneQGpKVls/9iUgMffVr66hlKXvt4tvYHknQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1694
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-20_06:2019-09-20,2019-09-20 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909200151
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

T25lIG9mIHRoZSBjb2RlIHJldmlldyBjb21tZW50cyBmb3IgbXkgRlJVIGR1bXAgdXRpbGl0eSB3
YXMgdGhhdCBJIHNob3VsZCB3cml0ZSB0aGUgcmVzdWx0cyB0byBwaG9zcGhvciBsb2cuDQoNClNo
b3VsZCB0aGUgb3V0cHV0IG9mIGEgdXRpbGl0eSB0aGF0IGlzIGJlaW5nIHVzZWQgZnJvbSBhIHNo
ZWxsIHByb21wdCBiZSBkaXNwbGF5ZWQgb24gdGhlIGNvbnNvbGUgb3Igc2VudCB0byB0aGUgcGhv
c3Bob3IgbG9nIGRlc3RpbmF0aW9uPw0KDQpJ4oCZbSB0aGlua2luZyB0aGF0IGl04oCZcyBiZXN0
IHRvIHJvdXRlIGl0IHNvbGVseSB0byB0aGUgY29uc29sZSBmb3IgdGhyZWUgcmVhc29uczoNCgkt
IGlmIHRoZXJl4oCZcyBzb21ldGhpbmcgd3Jvbmcgd2l0aCBsb2dnaW5nLCB0aGUgdXRpbGl0eSBi
ZWNvbWVzIHdvcnRobGVzcw0KCS0gV2hlbiBJ4oCZbSBpbnRlcmFjdGl2ZWx5IHJ1bm5pbmcgYSB1
dGlsaXR5LCBpdCBzZWVtcyBzdHJhbmdlIHRvIGdvIHRoZSBsb2cgZm9yIHRoZSByZXN1bHQgb2Yg
d2hhdCBJIGp1c3QgZGlkLg0KCS0gVGhlIG91dHB1dCBvZiB0aGUgdXRpbGl0eSB3aWxsIG9mdGVu
IGJlIHVzZWZ1bCBmb3IgbG9naWMgd2l0aGluIGEgc2NyaXB0LiBEaWdnaW5nIHRoZSBpbmZvcm1h
dGlvbiBvdXQgb2YgdGhlIGxvZyBjb21wbGljYXRlcyB0aGF0Lg0KDQpDb21tZW50cyBhcHByZWNp
YXRlZCwNCg0KV2lsZnJlZA==
