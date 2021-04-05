Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ABF354649
	for <lists+openbmc@lfdr.de>; Mon,  5 Apr 2021 19:47:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDdQf0Ttyz3028
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 03:47:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=l7eJPONs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b34;
 helo=mail-yb1-xb34.google.com; envelope-from=sandeepajesh@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=l7eJPONs; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDdQP3zHGz2yQr
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 03:47:08 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id z1so13287994ybf.6
 for <openbmc@lists.ozlabs.org>; Mon, 05 Apr 2021 10:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=38y90F1FQ23ANXlZArCZYpTniByDQyke/HhyfRsjGbw=;
 b=l7eJPONsXJ2edU7RBG9W6YRN0PCEyicD+6EKS4F2WKmDjy1HrsjCZZbRcKQo3PHkwD
 WkvLgj4lpWvIOo4oCe2JT/0DWI26GtI3JozD+HCa5LiiFXwRPmj6Dlyjw5pF7aet5W14
 RWFIckoE9VtUQSNxRUeBkBWgs2woOPFL1yteT/Ihr82Vj5Nmifk4DKIo5KtPv4rwzjDp
 D/5TlWUovvbux+OHofHVfPCQIz2UG92+aXU6gbgL8DeHQC5+1w2TVYLcfEx+jwmCxw88
 9M1fe1AK6YiYlnARL0GfhLbRLbYGN4IvITkKr2qkYbC4dlP4fRM0GywAFBhYlS8uFW31
 XL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=38y90F1FQ23ANXlZArCZYpTniByDQyke/HhyfRsjGbw=;
 b=qBkpOootc0ISWeCsXbMSgrrchwZaLvC1CkAAHjLRHPdPwIaBoR2z/rHmCD9Q9nc5AM
 1+JBtQl2zvi5O4wdyhtFhGU2DyqgaqGSPSDAP7ig6keAEKJHLRW13LSWnIBYPAOt24Ei
 4ZccSjWBmStWOmQRmT+XDnI22MTI0S4E0uH+BasY0/0duqfgCB7xii51bfihqKtRIbJz
 /kpl3JYccsABcaiFj0gs2+nFcmDN67nyQB+2dSo0eZCKVyX2s/1Xt7MHypkldebUehS2
 6fHT4v6z7pucLitLbtJSVhhlz1Tu/Xtp2nG6i68PBke8Elt7yhogZqI4UJ9WeBhQv2lb
 IunA==
X-Gm-Message-State: AOAM533xnQEC4EQztk1fUbh5+IVag/qHS0BvhtnJVaZgWI7v2/Fo6FlB
 wrmzDrGLDp7g3/rBUIboHXOVdENRGd48IEQFONC1PZJ5mMQ=
X-Google-Smtp-Source: ABdhPJzSZhQ3xbQtQE0dBtGxl9t0A/6chrBzECGWPpW9XP9U5KX+jeo4ttPYE/km08W5udXBcHvxsMEE6SPwsKa3mLw=
X-Received: by 2002:a25:38c6:: with SMTP id
 f189mr38947893yba.183.1617644823397; 
 Mon, 05 Apr 2021 10:47:03 -0700 (PDT)
MIME-Version: 1.0
From: sandeep sharma <sandeepajesh@gmail.com>
Date: Mon, 5 Apr 2021 23:16:51 +0530
Message-ID: <CAEMunhAZTchE56EGZAa9JbHBUTUaAigKgM4MvNr3MCcB=pm-QA@mail.gmail.com>
Subject: how to add a new user using ipmitool
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000012474005bf3d4962"
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

--00000000000012474005bf3d4962
Content-Type: text/plain; charset="UTF-8"

 We are working on a prototype based on ast2600  and can someone please
help me with commands to create a user using ipmitool in openbmc? Is there
any link which I can refer for all commands related to ipmi?

Steps I have tried:-
root@cn81xx-obmc:~# ipmitool user summary 1
Maximum IDs    : 15
Enabled User Count  : 1
Fixed Name Count    : 0
root@cn81xx-obmc:~# ipmitool user list 1
ID  Name     Callin  Link Auth IPMI Msg   Channel Priv Limit
1   root             false   true       true       ADMINISTRATOR
2                    true    false      false      NO ACCESS
3                    true    false      false      NO ACCESS
4                    true    false      false      NO ACCESS
5                    true    false      false      NO ACCESS
6                    true    false      false      NO ACCESS
7                    true    false      false      NO ACCESS
8                    true    false      false      NO ACCESS
9                    true    false      false      NO ACCESS
10                   true    false      false      NO ACCESS
11                   true    false      false      NO ACCESS
12                   true    false      false      NO ACCESS
13                   true    false      false      NO ACCESS
14                   true    false      false      NO ACCESS
15                   true    false      false      NO ACCESS
root@cn81xx-obmc:~# ipmitool user set name 2 newuser
Set User Name command failed (user 2, name newuser): Unspecified error
root@cn81xx-obmc:~# ipmitool user set name 2 newuser -vv
Loading IANA PEN Registry...
Running Get PICMG Properties my_addr 0x20, transit 0, target 0
Error response 0xc1 from Get PICMG Properties
Running Get VSO Capabilities my_addr 0x20, transit 0, target 0
Invalid completion code received: Invalid command
Acquire IPMB address
Discovered IPMB address 0x0
Interface address: my_addr 0x20 transit 0:0 target 0x20:0 ipmb_target 0

Set User Name command failed (user 2, name newuser): Unspecified error
root@cn81xx-obmc:~#

-- 
Thx-
Sandeep S

--00000000000012474005bf3d4962
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+DQoNCldlIGFyZSB3b3JraW5nIG9uIGEgcHJvdG90eXBlIGJhc2VkIG9u
IGFzdDI2MDDCoCBhbmQgY2FuIHNvbWVvbmUgcGxlYXNlIGhlbHAgbWUgd2l0aCBjb21tYW5kcyB0
byBjcmVhdGUgYSB1c2VyIHVzaW5nIGlwbWl0b29sIGluIG9wZW5ibWM/IElzIHRoZXJlIGFueSBs
aW5rIHdoaWNoIEkgY2FuIHJlZmVyIGZvciBhbGwgY29tbWFuZHMgcmVsYXRlZCB0byBpcG1pPzxk
aXY+PGJyPlN0ZXBzIEkgaGF2ZSB0cmllZDotPGJyPnJvb3RAY244MXh4LW9ibWM6fiMgaXBtaXRv
b2wgdXNlciBzdW1tYXJ5IDE8YnI+TWF4aW11bSBJRHMJIMKgIMKgOiAxNTxicj5FbmFibGVkIFVz
ZXIgQ291bnQgwqA6IDE8YnI+Rml4ZWQgTmFtZSBDb3VudCDCoCDCoDogMDxicj5yb290QGNuODF4
eC1vYm1jOn4jIGlwbWl0b29sIHVzZXIgbGlzdCAxPGJyPklEIMKgTmFtZQkgwqAgwqAgQ2FsbGlu
IMKgTGluayBBdXRoCUlQTUkgTXNnIMKgIENoYW5uZWwgUHJpdiBMaW1pdDxicj4xIMKgIHJvb3Qg
wqAgwqAgwqAgwqAgwqAgwqAgZmFsc2UgwqAgdHJ1ZSDCoCDCoCDCoCB0cnVlIMKgIMKgIMKgIEFE
TUlOSVNUUkFUT1I8YnI+MiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRydWUgwqAgwqBm
YWxzZSDCoCDCoCDCoGZhbHNlIMKgIMKgIMKgTk8gQUNDRVNTPGJyPjMgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFD
Q0VTUzxicj40IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdHJ1ZSDCoCDCoGZhbHNlIMKg
IMKgIMKgZmFsc2UgwqAgwqAgwqBOTyBBQ0NFU1M8YnI+NSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHRydWUgwqAgwqBmYWxzZSDCoCDCoCDCoGZhbHNlIMKgIMKgIMKgTk8gQUNDRVNTPGJy
PjYgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBm
YWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj43IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
dHJ1ZSDCoCDCoGZhbHNlIMKgIMKgIMKgZmFsc2UgwqAgwqAgwqBOTyBBQ0NFU1M8YnI+OCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRydWUgwqAgwqBmYWxzZSDCoCDCoCDCoGZhbHNlIMKg
IMKgIMKgTk8gQUNDRVNTPGJyPjkgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0cnVlIMKg
IMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj4xMCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5P
IEFDQ0VTUzxicj4xMSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0cnVlIMKgIMKgZmFsc2Ug
wqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj4xMiDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxi
cj4xMyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBm
YWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj4xNCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0
cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDCoCDCoE5PIEFDQ0VTUzxicj4xNSDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0cnVlIMKgIMKgZmFsc2UgwqAgwqAgwqBmYWxzZSDCoCDC
oCDCoE5PIEFDQ0VTUzxicj5yb290QGNuODF4eC1vYm1jOn4jIGlwbWl0b29sIHVzZXIgc2V0IG5h
bWUgMiBuZXd1c2VyIMKgIMKgIMKgIDxicj5TZXQgVXNlciBOYW1lIGNvbW1hbmQgZmFpbGVkICh1
c2VyIDIsIG5hbWUgbmV3dXNlcik6IFVuc3BlY2lmaWVkIGVycm9yPGJyPnJvb3RAY244MXh4LW9i
bWM6fiMgaXBtaXRvb2wgdXNlciBzZXQgbmFtZSAyIG5ld3VzZXIgLXZ2IDxicj5Mb2FkaW5nIElB
TkEgUEVOIFJlZ2lzdHJ5Li4uPGJyPlJ1bm5pbmcgR2V0IFBJQ01HIFByb3BlcnRpZXMgbXlfYWRk
ciAweDIwLCB0cmFuc2l0IDAsIHRhcmdldCAwPGJyPkVycm9yIHJlc3BvbnNlIDB4YzEgZnJvbSBH
ZXQgUElDTUcgUHJvcGVydGllczxicj5SdW5uaW5nIEdldCBWU08gQ2FwYWJpbGl0aWVzIG15X2Fk
ZHIgMHgyMCwgdHJhbnNpdCAwLCB0YXJnZXQgMDxicj5JbnZhbGlkIGNvbXBsZXRpb24gY29kZSBy
ZWNlaXZlZDogSW52YWxpZCBjb21tYW5kPGJyPkFjcXVpcmUgSVBNQiBhZGRyZXNzPGJyPkRpc2Nv
dmVyZWQgSVBNQiBhZGRyZXNzIDB4MDxicj5JbnRlcmZhY2UgYWRkcmVzczogbXlfYWRkciAweDIw
IHRyYW5zaXQgMDowIHRhcmdldCAweDIwOjAgaXBtYl90YXJnZXQgMDxicj48YnI+U2V0IFVzZXIg
TmFtZSBjb21tYW5kIGZhaWxlZCAodXNlciAyLCBuYW1lIG5ld3VzZXIpOiBVbnNwZWNpZmllZCBl
cnJvcjxicj5yb290QGNuODF4eC1vYm1jOn4jwqA8YnIgY2xlYXI9ImFsbCI+PGRpdj48YnI+PC9k
aXY+LS0gPGJyPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9zaWduYXR1cmUiIGRhdGEtc21h
cnRtYWlsPSJnbWFpbF9zaWduYXR1cmUiPjxkaXYgZGlyPSJsdHIiPjxkaXY+VGh4LTwvZGl2Pjxk
aXY+U2FuZGVlcCBTPGJyPjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pg0K
--00000000000012474005bf3d4962--
