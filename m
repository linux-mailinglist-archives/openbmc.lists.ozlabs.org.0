Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 565C796AEA
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 22:52:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CjfQ4vy4zDr4r
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 06:52:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3135ed6024=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="DsrAQYgT"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="QUqIRBlc"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cjdb12YQzDq9L
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 06:51:38 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7KKnxQ0028894; Tue, 20 Aug 2019 13:51:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=walAR0N+HVZKoxcplVkP5Hz/GRWSMV76392l2pjoSDw=;
 b=DsrAQYgTrx12ZdKAXDJF3NZb+3iOe/46TO1du79ih0ETqIzSVZwxelxhkIWQo5Gelgwp
 d70xfcS339oGG3DifljPTSkjoUhd+ujNkBPZKGDykesSYp1tTtcVcqz3N542e+eWMbbJ
 gCL0eYuCFmIFOjFqk0zXhlFIsChEIZ7W/tw= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2ugpj28frt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 20 Aug 2019 13:51:33 -0700
Received: from ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) by
 ash-exhub104.TheFacebook.com (2620:10d:c0a8:82::d) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 20 Aug 2019 13:51:31 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 20 Aug 2019 13:51:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QStHLG/FfHzkNpfga54ppz5XOsq9esTPjNzEq/aignG3BC2CmfnO1lRnQKRukNHAzwC3d+g3IQcBl6c+EE3U3tipaf0H6i9eq9AgpgudUamWkoSTPlznpbBKGZuIHWcyne+OOM3ucdYZBVos7EUEueTuqcNQN/G54UFXBRyqXbnAQbkJ7WB10OZ9p8nXOo7V9I5LFOhVCjb5hxJIjxWkadCNuoxzjMnadX6OjZu7ctS67HkoOWf0Cl/zrXWSpwiFdO74BKdu5X7Dd/zyrqF4/1SRt4Ddwbinx6AS7l8EHroTihF8mLfzzyEuifuCjO25J39h+HAbciQccYNpotJqnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=walAR0N+HVZKoxcplVkP5Hz/GRWSMV76392l2pjoSDw=;
 b=HuhgpwMSqtJH2xMCCjFUAPri8tymz0JJeALJKGm1LhAKjp+PLopxMgUcojRXyrp5r38ziLScKE0XsWOCyQU+g42WZQkrC29RUfTdZY04anKllmcCkDQzjz05A7iQf8fUaGieqk3SvsSM5I/g137nFjhGv6/8TwIUtYRUEOi9HKSZKwIpT3EztMxb0c53ZF5VA9WyGgGg/N//MIZhNbzTfzZizs4v/2YLBHCqbzyrL2/Y2JEE6UPIoldNMV/Y4L7gZ60d8L+pn9Z84rZOA7Rf75fSw5EcwPEBW7eHQ+1u8ZO14FXdOz0l89g70IUAEDgFuJWLgQMRV/wFMAUtUhasUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=walAR0N+HVZKoxcplVkP5Hz/GRWSMV76392l2pjoSDw=;
 b=QUqIRBlcuL+0j0DS2lFuzjvEitdHC94bzd5HafpfocLlCwexaNefYkaxxk9bUb3Xp3xB9IS/UrshoQ3/hcoJ6YMCeYXDKtAJc7ZIVB5rJSWeqyiiIN5ElIWdu8AV0lzMYONB9zzVYm1F1Awn9S8EkL0IbgVzuPhggqb/uM9qRgE=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1941.namprd15.prod.outlook.com (10.172.179.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Tue, 20 Aug 2019 20:51:29 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::8c93:f913:124:8dd0%8]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 20:51:29 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: A new repo for objc-debug-tools
Thread-Topic: A new repo for objc-debug-tools
Thread-Index: AQHVV5kKLN6QAtb1ZEi45DtoHhELIw==
Date: Tue, 20 Aug 2019 20:51:29 +0000
Message-ID: <9788269D-C3EB-45AC-8591-888907C4D145@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:2e05]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d1a689c-0a95-4885-3c6b-08d725b02d2b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1941; 
x-ms-traffictypediagnostic: CY4PR15MB1941:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <CY4PR15MB1941F5CDB77A3A5B93B8D606DDAB0@CY4PR15MB1941.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(366004)(396003)(39860400002)(376002)(199004)(189003)(81166006)(558084003)(2906002)(6916009)(8936002)(46003)(186003)(86362001)(790700001)(476003)(2616005)(486006)(66556008)(76116006)(36756003)(102836004)(33656002)(6116002)(6436002)(6506007)(66946007)(256004)(6512007)(236005)(54896002)(6306002)(66446008)(7736002)(91956017)(66476007)(64756008)(25786009)(53936002)(4326008)(6486002)(81156014)(8676002)(9326002)(99286004)(606006)(14454004)(316002)(71190400001)(478600001)(71200400001)(966005)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1941;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MONj0Ap0fDfWPdPQeSNI2RioNqZvt39lzUrN067qCyO4cVZDRF4E1rRNO+9dM5SSp7V/fJpsM1D4ynKS6Fi4wttRe3osq5gOq/FAbsXpzuByvRDj+E8ButhSdpFKzy+SuakYf7wJPlJHVH/7jxw0eRu03V0Av+rGf/oKUzIfFVh4uWVR1Dyn6hnhwcNbxOC4PMTKP6gF35iQQILL0745GczHJ/VXD4iAeOw6VVGC0II+2/w9rYPGW05HkeUOJz4WOkmZLf2kh4wUptpEeUn1OgYwGJn1PRVbLLkrK6NFCGU0aNdQ2nQipXwYulPfCFSxhzeTnzADbP8Sqr1aG+LFQASywhUTwwWWn3YoU4yMujtG5PJPVacqwRNlTNWg3Fs3//uzg1CsfNC4zcs9guhGp5eZMt3PzJ6fpCey912H7rw=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_9788269DC3EB45AC8591888907C4D145fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1a689c-0a95-4885-3c6b-08d725b02d2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 20:51:29.7634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ly5aHOtTmLl0/cYMJPmToFGLkuUEMWelVIM9OqMp9RgwmP0BJoO5WkuXCueLLy3lr0iwV2HsPdCOV4rDnlmNlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1941
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=545 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200187
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

--_000_9788269DC3EB45AC8591888907C4D145fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQnJhZCwNCkNhbiB5b3UgcGxlYXNlIGNyZWF0ZSBhIG5ldyByZXBvIGZvciBvYm1jLWRlYnVn
LXRvb2xzLiBJIGhhdmUgcHV0IGEgc2ltcGxlIGRvY3VtZW50IGhlcmUgYW5kIHdpbGwgZWxhYm9y
YXRlIGxhdGVyLg0KaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei8jL2Mvb3BlbmJt
Yy9kb2NzLysvMjQ1OTEvDQoNClJlZ2FyZHMNCi1WaWpheQ0K

--_000_9788269DC3EB45AC8591888907C4D145fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <859AC4A30CF8B640BD9C5B856F7D00A2@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6eD0idXJuOnNjaGVtYXMtbWljcm9z
b2Z0LWNvbTpvZmZpY2U6ZXhjZWwiIHhtbG5zOm09Imh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5j
b20vb2ZmaWNlLzIwMDQvMTIvb21tbCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnL1RSL1JFQy1o
dG1sNDAiPg0KPGhlYWQ+DQo8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9
InRleHQvaHRtbDsgY2hhcnNldD11dGYtOCI+DQo8bWV0YSBuYW1lPSJHZW5lcmF0b3IiIGNvbnRl
bnQ9Ik1pY3Jvc29mdCBXb3JkIDE1IChmaWx0ZXJlZCBtZWRpdW0pIj4NCjxzdHlsZT48IS0tDQov
KiBGb250IERlZmluaXRpb25zICovDQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJDYW1icmlh
IE1hdGgiOw0KCXBhbm9zZS0xOjIgNCA1IDMgNSA0IDYgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtm
b250LWZhbWlseTpDYWxpYnJpOw0KCXBhbm9zZS0xOjIgMTUgNSAyIDIgMiA0IDMgMiA0O30NCi8q
IFN0eWxlIERlZmluaXRpb25zICovDQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNv
Tm9ybWFsDQoJe21hcmdpbjowaW47DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6
ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBz
cGFuLk1zb0h5cGVybGluaw0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6IzA1NjND
MTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCmE6dmlzaXRlZCwgc3Bhbi5Nc29IeXBl
cmxpbmtGb2xsb3dlZA0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6Izk1NEY3MjsN
Cgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21zby1z
dHlsZS10eXBlOnBlcnNvbmFsLWNvbXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMt
c2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVsdA0KCXttc28tc3R5bGUt
dHlwZTpleHBvcnQtb25seTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpA
cGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEu
MGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7
fQ0KLS0+PC9zdHlsZT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlZGVmYXVsdHMg
djpleHQ9ImVkaXQiIHNwaWRtYXg9IjEwMjYiIC8+DQo8L3htbD48IVtlbmRpZl0tLT48IS0tW2lm
IGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlbGF5b3V0IHY6ZXh0PSJlZGl0Ij4NCjxvOmlkbWFw
IHY6ZXh0PSJlZGl0IiBkYXRhPSIxIiAvPg0KPC9vOnNoYXBlbGF5b3V0PjwveG1sPjwhW2VuZGlm
XS0tPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIj
OTU0RjcyIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SGkgQnJhZCw8bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dCI+Q2FuIHlvdSBwbGVhc2UgY3JlYXRlIGEgbmV3IHJlcG8gZm9yIG9ibWMtZGVidWctdG9vbHMu
IEkgaGF2ZSBwdXQgYSBzaW1wbGUgZG9jdW1lbnQgaGVyZSBhbmQgd2lsbCBlbGFib3JhdGUgbGF0
ZXIuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGEgaHJlZj0i
aHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei8jL2Mvb3BlbmJtYy9kb2NzLyYjNDM7
LzI0NTkxLyI+aHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei8jL2Mvb3BlbmJtYy9k
b2NzLyYjNDM7LzI0NTkxLzwvYT48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+
UmVnYXJkczxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij4tVmlqYXk8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8
L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_9788269DC3EB45AC8591888907C4D145fbcom_--
