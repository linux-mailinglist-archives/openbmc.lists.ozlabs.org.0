Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBAB2EC6A2
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 00:14:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DB4vV3sbQzDqkf
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 10:14:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DB4tb3mGlzDqkf
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2021 10:13:50 +1100 (AEDT)
IronPort-SDR: L4jMKEgFZ+p3kP4qpJAhl73afd520TOhA+T6hRoEAsOpbDMhztacwcryR48qybI5H8AwpQosQ7
 Ytu4QI9LBxQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9856"; a="174771342"
X-IronPort-AV: E=Sophos;i="5.79,328,1602572400"; 
 d="asc'?scan'208,217";a="174771342"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2021 15:13:46 -0800
IronPort-SDR: h7YfozDZ1p+OXF5la5kqWvC0va6MoqNzehxRNY8LXtIKtansgfu6sZbpmFtQCn9HTDu37FCDHh
 Erp++8wab4CA==
X-IronPort-AV: E=Sophos;i="5.79,328,1602572400"; 
 d="asc'?scan'208,217";a="497303699"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.75])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2021 15:13:46 -0800
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: phosphor-dbus-interfaces ChannelAccess regression?
Autocrypt: addr=johnathanx.mantey@intel.com; prefer-encrypt=mutual; keydata=
 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
 XxDp/X9P9w4=
Message-ID: <778bd779-c6fd-0d77-a39a-b0da2ffafa0a@intel.com>
Date: Wed, 6 Jan 2021 15:13:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LURY3qLC7GO0yA3scTto7m8riMNwWzWkr"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LURY3qLC7GO0yA3scTto7m8riMNwWzWkr
Content-Type: multipart/mixed; boundary="nihsqRi8LrxMDMF7ClfH6ZC7qwHyHDkO1"

--nihsqRi8LrxMDMF7ClfH6ZC7qwHyHDkO1
Content-Type: multipart/alternative;
 boundary="------------2DCA75097EF0D482A0CDD24F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2DCA75097EF0D482A0CDD24F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SXQgYXBwZWFycyB0aGVyZSBoYXMgYmVlbiBhIHJlZ3Jlc3Npb24gaW4gcGhvc3Bob3ItZGJ1
cy1pbnRlcmZhY2VzIGluCmhvdyBpdCBjb21iaW5lcyB0d28gZGlmZmVyZW50IFlBTUwgZmls
ZXMuIE15IGd1ZXNzIGlzIHRoZSBwcm9ibGVtCm9jY3VycmVkIHdoZW4gdGhlIHRyYW5zaXRp
b24gZnJvbSBDTWFrZSB0byBNZXNvbiB3YXMgcGVyZm9ybWVkLiBJJ2QKYXBwcmVjaWF0ZSBz
b21lIGd1aWRhbmNlIGZyb20gc29tZW9uZSBtb3JlIGZhbWlsaWFyIHdpdGggaG93IE1lc29u
IHdvcmtzLgoKRGV0YWlsczoKSW4gZHVuZmVsbCwgYW5kIENNYWtlIHdoZW4gSSBpc3N1ZSB0
aGlzIGNvbW1hbmQgZnJvbSB0aGUgQk1DIGNvbnNvbGU6CmJ1c2N0bCBjYWxsIC1qwqAgeHl6
Lm9wZW5ibWNfcHJvamVjdC5OZXR3b3JrIC94eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcmsK
b3JnLmZyZWVkZXNrdG9wLkRCdXMuT2JqZWN0TWFuYWdlciBHZXRNYW5hZ2VkT2JqZWN0cwoK
SSByZWNlaXZlOgouLi4KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgIi94eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcmsvZXRoMCIg
OiB7CsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAib3JnLmZyZWVkZXNrdG9wLkRCdXMuUGVlciIgOiB7
fSwKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgCiJvcmcuZnJlZWRlc2t0b3AuREJ1cy5JbnRyb3NwZWN0
YWJsZSIgOiB7fSwKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJvcmcuZnJlZWRlc2t0b3AuREJ1cy5Q
cm9wZXJ0aWVzIiA6IHt9LArCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKKiJ4eXoub3BlbmJtY19wcm9q
ZWN0LkNoYW5uZWwuQ2hhbm5lbEFjY2VzcyIgOiB7KioKKirCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICJNYXhQcml2aWxlZ2UiIDogeyoqCioqwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInR5cGUiIDogInMiLCoqCioq
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImRh
dGEiIDoKInByaXYtYWRtaW4iKioKKirCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIH0qKgoqKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9LCoKwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCiJ4
eXoub3BlbmJtY19wcm9qZWN0LkNvbGxlY3Rpb24uRGVsZXRlQWxsIiA6IHt9LAoKLi4uCgpU
aGUgc2FtZSBjb21tYW5kIGlzc3VlZCBmcm9tIGdhdGVzZ2FydGgsIGFuZCBNZXNvbiwgSSBy
ZWNlaXZlOgouLi4KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgIi94eXovb3BlbmJtY19wcm9qZWN0L25ldHdvcmsvZXRoMCIgOiB7
CsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAib3JnLmZyZWVkZXNrdG9wLkRCdXMuUGVlciIgOiB7fSwK
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgCiJvcmcuZnJlZWRlc2t0b3AuREJ1cy5JbnRyb3NwZWN0YWJs
ZSIgOiB7fSwKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJvcmcuZnJlZWRlc2t0b3AuREJ1cy5Qcm9w
ZXJ0aWVzIiA6IHt9LArCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKInh5ei5vcGVuYm1jX3Byb2plY3Qu
Q29sbGVjdGlvbi5EZWxldGVBbGwiIDoge30sCi4uLgoKQW55IHBvaW50ZXJzIG9uIGhvdyB0
byByZXN0b3JlIHRoZSBtaXNzaW5nIEQtQnVzIGRhdGE/CgotLSAKSm9obmF0aGFuIE1hbnRl
eQpTZW5pb3IgU29mdHdhcmUgRW5naW5lZXIKKmF6YWQgdGUqKmNobm9sb2d5IHBhcnRuZXJz
KgpDb250cmlidXRpbmcgdG8gVGVjaG5vbG9neSBJbm5vdmF0aW9uIHNpbmNlIDE5OTIKUGhv
bmU6ICg1MDMpIDcxMi02NzY0CkVtYWlsOiBqb2huYXRoYW54Lm1hbnRleUBpbnRlbC5jb20g
PG1haWx0bzpqb2huYXRoYW54Lm1hbnRleUBpbnRlbC5jb20+Cgo=
--------------2DCA75097EF0D482A0CDD24F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    It appears there has been a regression in phosphor-dbus-interfaces
    in how it combines two different YAML files. My guess is the problem
    occurred when the transition from CMake to Meson was performed. I'd
    appreciate some guidance from someone more familiar with how Meson
    works.<br>
    <br>
    Details:<br>
    In dunfell, and CMake when I issue this command from the BMC
    console:<br>
    <font face=3D"Courier New, Courier, monospace">busctl call -j=C2=A0
      xyz.openbmc_project.Network /xyz/openbmc_project/network
      org.freedesktop.DBus.ObjectManager GetManagedObjects<br>
      <br>
    </font>I receive:<br>
    <font face=3D"Courier New, Courier, monospace">...<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 "/xyz/openbmc_project/network/eth0" :
      {<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"org.freedesktop.DBus.Peer" :
      {},<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      "org.freedesktop.DBus.Introspectable" : {},<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      "org.freedesktop.DBus.Properties" : {},<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
<b>"xyz.openbmc_project.Channel.ChannelAccess"
        : {</b><b><br>
      </b><b>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "MaxPrivilege"
        : {</b><b><br>
      </b><b>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "type"
        : "s",</b><b><br>
      </b><b>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "data"
        : "priv-admin"</b><b><br>
      </b><b>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }</b><b><br>
      </b><b>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 },</b><br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      "xyz.openbmc_project.Collection.DeleteAll" : {},<br>
      <br>
      ...<br>
      <br>
    </font>The same command issued from gatesgarth, and Meson, I
    receive:<br>
    <font face=3D"Courier New, Courier, monospace">...</font><br>
    <font face=3D"Courier New, Courier, monospace">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      "/xyz/openbmc_project/network/eth0" : {<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
"org.freedesktop.DBus.Peer" :
      {},<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      "org.freedesktop.DBus.Introspectable" : {},<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      "org.freedesktop.DBus.Properties" : {},<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
      "xyz.openbmc_project.Collection.DeleteAll" : {},<br>
      ...<br>
    </font><br>
    Any pointers on how to restore the missing D-Bus data?<br>
    <br>
    <div class=3D"moz-signature">-- <br>
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <title></title>
      <font color=3D"#1F497D"><font face=3D"Century Gothic">Johnathan Man=
tey<br>
          <small>Senior Software Engineer</small><br>
          <big><font color=3D"#555555"><small><b>azad te</b><b>chnology
                  partners</b></small><br>
              <small><font color=3D"#1F497D"><small>Contributing to
                    Technology Innovation since 1992</small></font><small=
><br>
                  <font color=3D"#1F497D">Phone: (503) 712-6764<br>
                    Email: <a href=3D"mailto:johnathanx.mantey@intel.com"=
>johnathanx.mantey@intel.com</a></font></small><br>
                <br>
              </small></font></big></font></font> </div>
  </body>
</html>

--------------2DCA75097EF0D482A0CDD24F--

--nihsqRi8LrxMDMF7ClfH6ZC7qwHyHDkO1--

--LURY3qLC7GO0yA3scTto7m8riMNwWzWkr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAl/2RCoACgkQOcg9x5ua
KcBu2AgAiF4wDciU22y46v4Z1LHPdfkFGrYBIcxp7UaRZkckP+Dqa4+8m08pMwqO
W3uyFI/ZXJGbM2qUYKgno0/EM/FT9DZvqu+L0JxeRW279Q8njT4nf9gJ2xviyROZ
e5RtDtgR+MOQnaLEhcdQ91RXrsixNZOaK/QSZ9koh3x0JMFj5iXozFRLAU8HAkB5
tYPRfMVKltfpLZhLRq+NuenfJa6rptQDVp+YWW1ushpvhaM93nZcej5XPc3qDSL0
mMVkqq+U3kAnq54UjSNcIkxpGqGtfK5/Q1DM7Lmb4MKyksmHEAr4VdD6ASwJCdOt
TzkGpP2V3I57rbh+e3PPave7RAeQxg==
=MMPs
-----END PGP SIGNATURE-----

--LURY3qLC7GO0yA3scTto7m8riMNwWzWkr--
