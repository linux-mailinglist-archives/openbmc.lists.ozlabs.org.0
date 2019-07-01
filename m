Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C99075C1E6
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2019 19:22:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cvMX29HtzDqZL
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 03:22:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=20852649b7=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="P0gf0nLF"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="P9D8IYAK"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cvLv1XBnzDqVn;
 Tue,  2 Jul 2019 03:22:13 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x61HHQdl019421; Mon, 1 Jul 2019 10:22:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=FFv9I3iRmbRdIQC2PGgwRVZV5PTbraYms/uwkGHdzlU=;
 b=P0gf0nLFqZ65RH5nS9IvDB9Z2Bp0bs87x1I4YquftOuh+W+6DxBPPMcqTkQsxW9KvsGd
 H9FAo75kFOeh+1aF3hPCE4HZeVWu6I4IrfmTEt+2TVf/afDMyIUgZaVAmUyE6E0flKAg
 1xzH40fwpWgGug7OeQ/TpMIjma9HjUYXelE= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2tfkpsrr9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 01 Jul 2019 10:22:09 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 1 Jul 2019 10:22:07 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 1 Jul 2019 10:22:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=MncUu+EPwaHbao+xOVuEVo/1c6K+Jo5EzZjEYcT5B+jdGnfMqfuUdK1nWFwSK8xC/d4DDBxslOO5FAjIS3Df2msZBu54nR6Qzv1MTDBVEGCA5AveeYPmOAqp7Lxp8nZRkUk6FFeqYt2HbwZYZbUNiqc/HS4JXWlvNUWjB9wOmZk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFv9I3iRmbRdIQC2PGgwRVZV5PTbraYms/uwkGHdzlU=;
 b=IMffxiecBFC1ZJ+Zv71dVro1gqvITaD8i0UKrXDqm0+f3e1jLDNOfw6AsnztdfrIzBggi8KDblm9DLAtJPKEd/T0CLVIM43kKyBxAnacCEqfDPDd3LCoX0wAx8QN6hnk3gLj29i3GOVklYz0ccNAG+izq7/6MLeMv+i86q11umQ=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFv9I3iRmbRdIQC2PGgwRVZV5PTbraYms/uwkGHdzlU=;
 b=P9D8IYAKWRPLzIFIHb4BMwMfJyD6sOuvlP9+WFOiQ2AoCZw27NkWBrQELsfYKjKqA9gXEifKHe0nyTa4GgiGgUSezfWUcsESwMB85cRzKy57B7RUI4gCdS7s+aKMjC0wzTveVRjpgTVnQE8kodgtGxwfZAr0XFyzge346Noas+E=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1350.namprd15.prod.outlook.com (10.172.158.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 1 Jul 2019 17:22:06 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2869:360d:bfc4:de68]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2869:360d:bfc4:de68%7]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 17:22:06 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: obmc console history
Thread-Topic: obmc console history
Thread-Index: AQHVLFdLPkq8+/IBqkCiQwjkzhHXQKauacyAgAcrLwA=
Date: Mon, 1 Jul 2019 17:22:06 +0000
Message-ID: <6975825B-D712-4004-94A9-2E70DE34F5DE@fb.com>
References: <BB3AF06A-F1A5-4999-8D8F-BD58F39D68D3@fb.com>
 <0949cd7146560649af469c88e0e38c18@linux.vnet.ibm.com>
In-Reply-To: <0949cd7146560649af469c88e0e38c18@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:6421]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9464626-f72b-4269-88cf-08d6fe48a456
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1350; 
x-ms-traffictypediagnostic: CY4PR15MB1350:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR15MB13502E5EAC3676E2BD754DC3DDF90@CY4PR15MB1350.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(39860400002)(366004)(376002)(346002)(45914002)(189003)(199004)(76116006)(25786009)(4326008)(8936002)(6306002)(66946007)(5660300002)(7736002)(33656002)(53936002)(66476007)(478600001)(6486002)(81156014)(73956011)(86362001)(11346002)(81166006)(66556008)(446003)(6512007)(229853002)(91956017)(6916009)(64756008)(2906002)(7116003)(66446008)(6246003)(8676002)(6116002)(3480700005)(68736007)(4744005)(46003)(186003)(6436002)(476003)(2616005)(36756003)(14454004)(99286004)(316002)(53546011)(256004)(6506007)(102836004)(76176011)(54906003)(71190400001)(71200400001)(305945005)(966005)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1350;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sMD0W+ajtCI+x8HxmBlzzDhbMfbV7DJWp4XGyuIfmtgidssIlax06vwfL+63sxaovEIdVZvquFoKgQhPPwrSvthdOdzcIZb4VRa+e5Woto5LBzQElnpitDFAm2b7iuD67OXrXJ0Yqo21JKkycKooF8/Gmje/xcACtleI5ybZhfJHcZAMMVVTLuKvYFkWkfV+e/t4qgXpphY71Mn6+r0MnOUjbPbDkcK2Y16iTwiu3WCC/fYKk2xFrnMQN5YlqHGTuwVeh5thTCj8YjGHVCbsolfCRgkBCxMncCsxy9nrDoH2vd506VSAOIQtfmrdJQ4RyeoVW+NT+Bppy3fHRLdJjr+UxbW2WyLQc1gDQHENX7POeF531lFbBETX/hjMpc5lE8qfeGCFsWPqjxLxsDEZneoXEMM6n+XvUD4Q/C++TZM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FA96AA0D443D74196DA5E32528CDF42@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a9464626-f72b-4269-88cf-08d6fe48a456
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 17:22:06.6637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vijaykhemka@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1350
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-01_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907010203
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 openbmc <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDYvMjYvMTksIDE6NTIgUE0sICJKb3NlcGggUmV5bm9sZHMiIDxqcmV5QGxpbnV4
LmlibS5jb20+IHdyb3RlOg0KDQogICAgT24gMjAxOS0wNi0yNiAxNDo0MiwgVmlqYXkgS2hlbWth
IHdyb3RlOg0KICAgID4gSGksDQogICAgPiANCiAgICA+IERvIHdlIGhhdmUgb3B0aW9uIG9mIHN0
b3Jpbmcgb2JtYyBjb25zb2xlIGhpc3Rvcnkgc29tZXdoZXJlIHdoaWNoIGNhbg0KICAgID4gYmUg
cmVmZXJyZWQgbGF0ZXIgb24uDQogICAgDQogICAgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
cGhvc3Bob3ItaG9zdGxvZ2dlcg0KDQpJIGFtIHNlZWluZyBmb2xsb3dpbmcgZXJyb3IsIGlzIHRo
ZXJlIGFueSBjb25maWcgcmVxdWlyZW1lbnQgZm9yIHJ1bm5pbmcgdGhpcy4NCg0KVW5hYmxlIHRv
IGNvbm5lY3QgdG8gaG9zdCBsb2cgc29ja2V0OiBlcnJvciBbMTExXSBDb25uZWN0aW9uIHJlZnVz
ZWQNCg0KICAgIA0KICAgID4gUmVnYXJkcw0KICAgID4gDQogICAgPiAtVmlqYXkNCiAgICANCg0K
