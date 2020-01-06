Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DB5131C90
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 00:53:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sC5P6d2xzDqS0
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 10:53:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=8274c753a8=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="HDZgd9qn"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="N29X5CXK"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sBl26R38zDqJl
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 10:37:49 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 006NXgNs028926; Mon, 6 Jan 2020 15:37:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=jfOwkjv9lsPjfpvK317OrdYSfsfyHzYJPfTZTqCM+v4=;
 b=HDZgd9qnhBxJ1UA7EIxSYAImliDtqzducKKqIN84PY8ddleq01XztoZdp3pkTENGCS8R
 zOsgb3I6rP0Q7mLYbrtLsnmz9rLhfXIJXA1NNnV6radqKk1cs1IOIinsUPi1JrBAEQl2
 XOxcfwi9x4isfpV9iwLjkRjADTNTM8j5Gjk= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2xasdpb5h6-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 06 Jan 2020 15:37:44 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 6 Jan 2020 15:37:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=It6sZvvbdmEJ0v/F6peQcvWzZCfrzBFUDvklTHKgVwUlM1lDNclOjJC/ezcVNv+Z3p5p1V90KDqDLQ+j46ONIyIjGvnDLv67SXrZs47A+z14H0hm/x8Ei+RR30jjX+2Lz20FXcMl2ipApyXcIFkt2R5qYuiweU+R6tUIYEsn2/4yX6JDjH5e7YAUGSfRm2ZgQjhLDgMr4EyrLWRXxoOVZRRNHgxCVHF6h4lRxR0+S5hcBOk+gJepwacINiqS/rUCkZY6czbHl+uE8Fa9gZn5v7mrN+13sn5qJhDy4fggyo/3vgvV7LYALU79YwCxnfUixzUmu4n3VLksYQU8IecyMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfOwkjv9lsPjfpvK317OrdYSfsfyHzYJPfTZTqCM+v4=;
 b=g9AZ6WQo5M0RvtW8Vf+RpzMOxCjjph41Cz7eC5OLgaR2TJkRWI9SrRjmHkGKpXj/W7bChym5KuQTiE39IwTKMOwmoDOI+uvrS6/OmkUxkmWxG6YKwvOM3OeOIuP/M+tix4IpzBPR5hI/+pSARIzFg86GZcnwih8ChpzpZIUtjq5rLErphj7z9od/1yMmjCemZ+YFA/5Su+W9G3WdQH7DbFyuWqcgteSg8RTaH2cpkCZe8U3K7ZAR8IXZGFHZ6CeMfPVnmGVvFE3m/FK/Y9bfEUcDiD13plJUoCuK/XBOuMPGH7kjCg1wcmncTk8sjQdudfRLGzqPPiy3w/XS/o92Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfOwkjv9lsPjfpvK317OrdYSfsfyHzYJPfTZTqCM+v4=;
 b=N29X5CXKS9DCRicGjG/uZkQBS2amGqieev+AiQ02bxysgIRkSPEBQ6muyThLZ6fFDAC67HIuzQjjEkKB9p1aP7xigeBpsPAHsGewyI/DPEA4QwITL8oTKnEp9ejED6JDswCdN5a9KZwEXZ0t5F8s8OBXmab7rEnj4KepHMQE77g=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1405.namprd15.prod.outlook.com (10.173.233.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.15; Mon, 6 Jan 2020 23:37:37 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 23:37:37 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Alex Qiu <xqiu@google.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: Configuring shunt_resistor in hwmon
Thread-Topic: Configuring shunt_resistor in hwmon
Thread-Index: AQHVxNbnWsHVdw6gREuhaICLGnBKdafdxMIA
Date: Mon, 6 Jan 2020 23:37:37 +0000
Message-ID: <B109D1A5-C1B5-41CF-9405-DAF4A2E3FD9C@fb.com>
References: <CAA_a9xLm_3CthjLS0rKQCcqYfciFWEXh-9BV4W=AebumP8Rf4A@mail.gmail.com>
In-Reply-To: <CAA_a9xLm_3CthjLS0rKQCcqYfciFWEXh-9BV4W=AebumP8Rf4A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:889a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0681fddb-fe1d-4bbb-643d-08d7930169b7
x-ms-traffictypediagnostic: MWHPR15MB1405:
x-microsoft-antispam-prvs: <MWHPR15MB140549C2708CC6CF469BDEFADD3C0@MWHPR15MB1405.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(366004)(396003)(136003)(346002)(199004)(189003)(4744005)(8936002)(2616005)(36756003)(5660300002)(6506007)(53546011)(54906003)(186003)(110136005)(33656002)(6486002)(478600001)(81156014)(66446008)(64756008)(66476007)(66946007)(81166006)(4326008)(8676002)(76116006)(6512007)(66556008)(2906002)(86362001)(316002)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1405;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AsJiIrhqVp4WSp76HxZ1DPGzHKOV2+2SmdMeVlzKliWbUb9t9f4nMNE3kX6uilnHzPUO3vVfNqbVuXnV+n+6qwWiwh8/+Ffj+s/cqMI0ChELdAlG52tM+y3z/42kEyO7qccTA7v+AIydEsVo9vSHUSKLh+Mhrq06IYXInVK2+zawC78SFM/qbiGk4m2qIMxqPuC/w261ZII0cdGh058HUkmZ5TDvgp4ooYwCAnOKSbWsfjdqR/4XieCYCPz5pRwES/WgkXd6Ynw+c5/P9DRaA8JWjO/xx1fdCMmvLtK2Q21Nn8b0NKqbdqFPI1g7w1TjEABZQFh5yygziYvL8cIsVtYMDx3NGGSiNkPBZssnVTmLjM9JenL5oQjkYhGbIdgDoN7kuwh3dpMFkWBtjLso9ohQ2hmQwHhOoKueTihfGth1YGr1+DCOIXn1dPNZ4mCV
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_B109D1A5C1B541CF9405DAF4A2E3FD9Cfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0681fddb-fe1d-4bbb-643d-08d7930169b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 23:37:37.1952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U46iR03F3AQYpglWO93ll9AcT28c0uCmvEZfS6wxdIFGAIMx2KVM7RTM7hUEN/ddJrbPqZr6AlwkUGbtWKnvUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1405
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_08:2020-01-06,2020-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0
 clxscore=1011 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001060190
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
Cc: Josh Lehan <krellan@google.com>, Kais Belgaied <belgaied@google.com>,
 Devjit Gopalpur <devjitg@google.com>,
 Peter Lundgren <peterlundgren@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_B109D1A5C1B541CF9405DAF4A2E3FD9Cfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WW91IHNob3VsZCBiZSBhYmxlIHRvIGRlZmluZSB0aGlzIHZhbHVlIGluIGRldmljZSB0cmVlLiBP
ciB5b3UgY2FuIGNhbGN1bGF0ZSBzY2FsZSBmYWN0b3IgYW5kIHVzZSBpdCBpbiBlbnRpdHkgbWFu
YWdlci4NCg0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNv
bUBsaXN0cy5vemxhYnMub3JnPiBvbiBiZWhhbGYgb2YgQWxleCBRaXUgPHhxaXVAZ29vZ2xlLmNv
bT4NCkRhdGU6IE1vbmRheSwgSmFudWFyeSA2LCAyMDIwIGF0IDE6MTggUE0NClRvOiAib3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnIiA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KQ2M6IEpvc2gg
TGVoYW4gPGtyZWxsYW5AZ29vZ2xlLmNvbT4sIEthaXMgQmVsZ2FpZWQgPGJlbGdhaWVkQGdvb2ds
ZS5jb20+LCBEZXZqaXQgR29wYWxwdXIgPGRldmppdGdAZ29vZ2xlLmNvbT4sIFBldGVyIEx1bmRn
cmVuIDxwZXRlcmx1bmRncmVuQGdvb2dsZS5jb20+DQpTdWJqZWN0OiBDb25maWd1cmluZyBzaHVu
dF9yZXNpc3RvciBpbiBod21vbg0KDQpIaSBPcGVuQk1DIGZvbGtzLA0KDQpJcyB0aGVyZSBhIHdh
eSB0byBjb25maWd1cmUgdGhlIHNodW50X3Jlc2lzdG9yIHZhbHVlIGZvciBhIGh3bW9uIHdpdGgg
ZW50aXR5LW1hbmFnZXIgb3Igb3RoZXIgbW9kdWxlcz8gV2UgbmVlZCB0byBjb25maWd1cmUgdGhp
cyB2YWx1ZSB0byBtYWtlIHRoZSBJTkEyMzAgcmVwb3J0IGNvcnJlY3Qgdm9sdGFnZSwgYnV0IGZv
ciBub3cgSSBkb24ndCBmaW5kIGFueXRoaW5nIGluIHRoZSBjb2RlIGZvciBpdC4gU2hhbGwgdGhp
cyBiZSBhIGZlYXR1cmUgdG8gaW1wbGVtZW50PyBUaGFua3MhDQoNCi0gQWxleCBRaXUNCg==

--_000_B109D1A5C1B541CF9405DAF4A2E3FD9Cfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <0EFAEF0C26477D4884805EF0348C1304@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpw
Lm1zb25vcm1hbDAsIGxpLm1zb25vcm1hbDAsIGRpdi5tc29ub3JtYWwwDQoJe21zby1zdHlsZS1u
YW1lOm1zb25vcm1hbDsNCgltc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzsNCgltYXJnaW4tcmlnaHQ6
MGluOw0KCW1zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvOw0KCW1hcmdpbi1sZWZ0OjBpbjsNCglm
b250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCnNw
YW4uRW1haWxTdHlsZTE4DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQt
ZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1zb0No
cERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBw
dDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEu
MGluIDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2Vj
dGlvbjE7fQ0KLS0+PC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIj
MDU2M0MxIiB2bGluaz0iIzk1NEY3MiI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+WW91IHNob3VsZCBiZSBhYmxlIHRvIGRlZmluZSB0aGlzIHZhbHVl
IGluIGRldmljZSB0cmVlLiBPciB5b3UgY2FuIGNhbGN1bGF0ZSBzY2FsZSBmYWN0b3IgYW5kIHVz
ZSBpdCBpbiBlbnRpdHkgbWFuYWdlci48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVy
LXRvcDpzb2xpZCAjQjVDNERGIDEuMHB0O3BhZGRpbmc6My4wcHQgMGluIDBpbiAwaW4iPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PGI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6
YmxhY2siPkZyb206IDwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29s
b3I6YmxhY2siPm9wZW5ibWMgJmx0O29wZW5ibWMtYm91bmNlcyYjNDM7dmlqYXlraGVta2E9ZmIu
Y29tQGxpc3RzLm96bGFicy5vcmcmZ3Q7IG9uIGJlaGFsZiBvZiBBbGV4IFFpdSAmbHQ7eHFpdUBn
b29nbGUuY29tJmd0Ozxicj4NCjxiPkRhdGU6IDwvYj5Nb25kYXksIEphbnVhcnkgNiwgMjAyMCBh
dCAxOjE4IFBNPGJyPg0KPGI+VG86IDwvYj4mcXVvdDtvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcm
cXVvdDsgJmx0O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZndDs8YnI+DQo8Yj5DYzogPC9iPkpv
c2ggTGVoYW4gJmx0O2tyZWxsYW5AZ29vZ2xlLmNvbSZndDssIEthaXMgQmVsZ2FpZWQgJmx0O2Jl
bGdhaWVkQGdvb2dsZS5jb20mZ3Q7LCBEZXZqaXQgR29wYWxwdXIgJmx0O2RldmppdGdAZ29vZ2xl
LmNvbSZndDssIFBldGVyIEx1bmRncmVuICZsdDtwZXRlcmx1bmRncmVuQGdvb2dsZS5jb20mZ3Q7
PGJyPg0KPGI+U3ViamVjdDogPC9iPkNvbmZpZ3VyaW5nIHNodW50X3Jlc2lzdG9yIGluIGh3bW9u
PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj5IaSBPcGVuQk1DIGZvbGtzLCA8bzpwPjwvbzpwPjwvcD4NCjxkaXY+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPklzIHRoZXJlIGEgd2F5IHRvIGNvbmZpZ3VyZSB0aGUgc2h1bnRfcmVzaXN0
b3IgdmFsdWUgZm9yIGEgaHdtb24gd2l0aCBlbnRpdHktbWFuYWdlciBvciBvdGhlciBtb2R1bGVz
PyBXZSBuZWVkIHRvIGNvbmZpZ3VyZSB0aGlzIHZhbHVlIHRvIG1ha2UgdGhlIElOQTIzMCByZXBv
cnQgY29ycmVjdCB2b2x0YWdlLCBidXQgZm9yIG5vdyBJIGRvbid0IGZpbmQgYW55dGhpbmcgaW4g
dGhlIGNvZGUgZm9yIGl0LiBTaGFsbA0KIHRoaXMgYmUgYSBmZWF0dXJlIHRvIGltcGxlbWVudD8g
VGhhbmtzITxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PGJyIGNsZWFyPSJhbGwiPg0KPG86cD48L286cD48L3A+DQo8ZGl2Pg0KPGRpdj4NCjxkaXY+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4tIEFsZXggUWl1PG86cD48L286cD48L3A+DQo8L2Rpdj4N
CjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+
DQo=

--_000_B109D1A5C1B541CF9405DAF4A2E3FD9Cfbcom_--
