Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0321D5B33
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 23:09:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49P1JG4B1XzDr5D
	for <lists+openbmc@lfdr.de>; Sat, 16 May 2020 07:09:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2404b589be=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=NrwQZd7t; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=SASMTDgr; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49P1GN5sBZzDr4q
 for <openbmc@lists.ozlabs.org>; Sat, 16 May 2020 07:08:12 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04FL64xp016240; Fri, 15 May 2020 14:08:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=pPLdQNtg3ATe3ezmUTQLfn5h4FcpldcoZKr0I/tHJcM=;
 b=NrwQZd7t3TAsaR+yWiCmLLbm6Va1wzW551KA5rOc4NYI6hlWs3p8VTfzNTEEQI5c7jo6
 Wd5jPOZcgWg4olOIgslvflHkJjnyFU9Tl58dNeV7FM0zpvyr+RRbY2QfsYDr5R32uaKS
 sJ59SoPcIwQB24+hUwU7df7AbZJhrgknj6g= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3119kpyu3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 15 May 2020 14:08:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Fri, 15 May 2020 14:08:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gl8PFRGebfPB8RVAVjo/DpePqpALIUMDCW8I7gtOtn65caV7S8loIGECSEH5W5hTHrxNfSSxI9mElUafXta87ZyqBFLWhMtXyPYxpRNbtf1k7x0NiXHQBajTKmNKPFWIYLtgsm70dDiejJInRvXYiFifA2SzAE66jj5jg5XGgmq0Uz5bJlTjVZ8D/x88aNWcjLzHrUT+sVKeXoH7x60qXNB55jg/fVX/E0+V3trC1jvMH3RP1MSG84Xtzru1U1lA/rVk7CjHfYCQxtpDC1puzK9lz1UXArekcSsnjWTdqzNXQRhNHWdbIDWAiUeVk1BRrHPv0c817jjcVM2WZMUblw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPLdQNtg3ATe3ezmUTQLfn5h4FcpldcoZKr0I/tHJcM=;
 b=NsBHbVb6i51TTb9B/r2h7wZDVNx+x9EtLuW6m/+r1CDq5OirZYLn22pihyRZ1aLoyq+A+Byhbnev7391JPu6Lj4QAmQ0y1WdX4emtI3yeRwgol1XkuB0smh/dP00cKdzjgASlxtBOmYsSEvdHsleqBPANIzUMPSAIq4QoSfiwB9+tzKWCRYY8fMaG8efXkwAFLBqQqmsJ/B72rGzcZ/owyEgFNJ2X6Lew6Uow37tYc2/8/0Mu90+CPl2gUnwwc4y9+b7ypcyULo3npcBOiTY0xJU6iNaufCtLxgfsIcPoVjm1RIVsWLOJr+T0RZ3nfhQbZdgfirLVF+aPIIddg9Odw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPLdQNtg3ATe3ezmUTQLfn5h4FcpldcoZKr0I/tHJcM=;
 b=SASMTDgrqXjjn4cK4JjFehGA+qfTdczenD7omVS/1IGfV7HLPS9KccR+5amH5YRKRYo3vYVcS94Mc/zZwh4pF8Sn9itYN6uizcJcHMwjEXMc9lmddcQVRvvo71H+dTWZiQMBNZY5KeaP1jeQrPdFHbXm/j0XuAvAOGyS5vEZRGY=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2309.namprd15.prod.outlook.com (2603:10b6:a02:8b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Fri, 15 May
 2020 21:08:07 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2979.033; Fri, 15 May 2020
 21:08:07 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: phosphor-health-monitor repo
Thread-Topic: phosphor-health-monitor repo
Thread-Index: AQHWJA4sk8meb7nphECQ9HJxRwpJWKik+YMAgARC4wA=
Date: Fri, 15 May 2020 21:08:07 +0000
Message-ID: <0B4BA5EE-35E4-4793-9AD0-A0954B5E4B61@fb.com>
References: <13E6D0A2-69B1-4F89-92FA-F0A234682B28@fb.com>
 <bb5d34b2371a2a63f93e67b7d176e14a91912da8.camel@fuzziesquirrel.com>
In-Reply-To: <bb5d34b2371a2a63f93e67b7d176e14a91912da8.camel@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none;fuzziesquirrel.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:3d17]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be6d28c6-cc2f-45a5-04af-08d7f91410cb
x-ms-traffictypediagnostic: BYAPR15MB2309:
x-microsoft-antispam-prvs: <BYAPR15MB2309781E71BCF6D1702EC3CFDDBD0@BYAPR15MB2309.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 04041A2886
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CgoRLCWLhQ1sVzWeaLu+FkqYSpYQgaEGifSK4t2xfPD4SmWGxgxGgcScQ38+Ti1LnJItI8k4lXOtgnKxD6gTy2A4woNEW3IC0N/dkyCCYOCXWfdATryQPfkosqJAzMG5U6UJLomIH6vaWlyf8zeUQnrKIVQI7dTgiiLs0ZrtlR3q4wxOKqyi3sYLYhy7PwIHn3jUjep6kMOSy/LIVHR0Ib107Vf7KvdPePP+JnmlOWGKB8qd5mJL+BggAOfgZDJEe96ZyeiLyyOUo0FdA9efPTTUt8BG2TPEjBIfrUQj5SgfbVEmwBVl/X4da0MqoYLGRAik9vlZJ/jR76172t+/1z4CPfToj9LBefUCGSWnn+829OomJGhevY6gHlHZUb9FaJOGlUWxb/DSD446Y3jthhYnr6av1Q1v1JDQcF98VrtCFwX7fKU+tk+5RSnkl5/N
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(376002)(366004)(346002)(396003)(136003)(478600001)(33656002)(6512007)(3480700007)(71200400001)(2906002)(6486002)(86362001)(4326008)(6916009)(8676002)(5660300002)(8936002)(66446008)(76116006)(186003)(316002)(6506007)(36756003)(66556008)(2616005)(66946007)(64756008)(66476007)(558084003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: bRQJUKU73JoBoewtMn503Tu6ZfSk45+76ppzQPY6lZTWN6i6ADkwr1zDlNaCcYfN/mNKyyApnd/ODUc+0+VqFYf/8ZasTFoElXproD8UXIewubcaaydR3bQsdx+aaATG8kUABPn37GUFzLGyOYwlmM43Mbr/jj+xAA4DkqZlwUT48vM+HS20bTvc3VcCPjVEJQ+XxfILnCikFyTo2MCphMyXeLAmykgFfTrTxeW9FUHg7Q5DmvSM7TRKKDAdOWcnjJrq2jQHfAT1IF0TT8IP3CaSGiBzy0wS1lCXPOvr3bQfIn5edrJ4Vo3SUo/I7ALsoex/9PkLYV/EjwKroMSeVOM/21kk3y9svRD9llsZOGhaBJpGyJh723CicnrBnxkuwDEFrCIj8jo5wF3JxHv0lkVFaNspT+9bRTtCl+FnrsxxW+pF+5uEeYjhV1bLVgR/IbmtP3iVMXeD3scumb1DaEMTECUayUbAQyK5nbBHzy3mD7AJKMHt1HL/r0o65Q4jZiZoEdSZOEoMxuQ9eWHcpw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <02F41E079C181844B0668C811AD80BF2@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: be6d28c6-cc2f-45a5-04af-08d7f91410cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2020 21:08:07.2397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h9QqAWy5/Yq12ah4OQGFzKbjGxvcM6+YGWGOvEh1Oupr+FmoN/ARz8KUI4XvTaUYrDh0py13hpfbIFautokuFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2309
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-15_07:2020-05-15,
 2020-05-15 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 lowpriorityscore=0 suspectscore=0 cotscore=-2147483648 mlxlogscore=674
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005150176
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

VGhhbmtzIEJyYWQuDQoNCu+7v09uIDUvMTIvMjAsIDI6MDMgUE0sICJCcmFkIEJpc2hvcCIgPGJy
YWRsZXliQGZ1enppZXNxdWlycmVsLmNvbT4gd3JvdGU6DQoNCiAgICBPbiBUaHUsIDIwMjAtMDUt
MDcgYXQgMDE6MjMgKzAwMDAsIFZpamF5IEtoZW1rYSB3cm90ZToNCiAgICA+IEhpIEJyYWQsDQog
ICAgPiBDYW4geW91IHBsZWFzZSBjcmVhdGUgYSBuZXcgcmVwbyBmb3IgcGhvc3Bob3ItaGVhbHRo
LW1vbml0b3IuDQogICAgDQogICAgRG9uZSEgIEFwb2xvZ2llcyBmb3IgdGhlIGRlbGF5Lg0KICAg
IA0KICAgIHRoeCAtYnJhZA0KICAgIA0KDQo=
