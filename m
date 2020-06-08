Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2201F117F
	for <lists+openbmc@lfdr.de>; Mon,  8 Jun 2020 04:49:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gHlV6jvXzDqWm
	for <lists+openbmc@lfdr.de>; Mon,  8 Jun 2020 12:49:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b42; helo=mail-yb1-xb42.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=A/+RFFj2; dkim-atps=neutral
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gHkn0XR1zDqTm
 for <openbmc@lists.ozlabs.org>; Mon,  8 Jun 2020 12:48:43 +1000 (AEST)
Received: by mail-yb1-xb42.google.com with SMTP id s1so3884650ybo.7
 for <openbmc@lists.ozlabs.org>; Sun, 07 Jun 2020 19:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=W+xsDt2ofOv3wfQ910H5dmK0X93Rv+5SofXu+lCrW/Q=;
 b=A/+RFFj2ICtjdPcN9EZ87zmVXBuyjrK3T0JVKs8urL1lZH6mC32dh7b7K3qt6dhZLX
 aibGYos4Yp2nnm9P1YfLHIqvlSgH4OjRwcxPwBOdSA7ceTW+yXs/Wd5G+yJZhTD8Jnsz
 OXl5wFmlR0ZVLXiFL1UnmXUmPU95XdPBx7W28450weDZkjRIYXnOMNk5W3E1c3O1fu+p
 WAZYSzWD1IRt/s6OG8YucLc3IGKa5t/xdCEEZTM10fxeJSQ2g609+TNQ1sB3Hp3IKKwX
 2quNStbQQZak+cK4cCZV/iLPe8J/BbRNkrdF9bF1z8DQrfS+iMEU43b7qrsI8Y1EULIe
 ilPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=W+xsDt2ofOv3wfQ910H5dmK0X93Rv+5SofXu+lCrW/Q=;
 b=q22zY0/iyge6GwhXu42d5aKlYV2m138vNkpDPDINfIHkgx75m852V0fe1c0E6YV9te
 +bnSw7QT20HUoBSumIxPjAsYvWJuDUhdjWP9g19aulQBitpJK5sbPXHRTqSC8AN2RUkt
 T2iHQt+yJeH6l6ZrGRRS1vCmkNt0r6MRfBo/SKFamEC+WMXvTpgHK8+BDnWrNlb2q7mt
 fEc4/FTqIye5Az0ST+MVyo11fuBr5pT484Zj7vyIRUt3wE4/3zzR9yqd5AabfHSOxcFV
 SS0/Ejn5yAJClJ5r30twNCyWo8gsJg3LAWf/d5QyxlFakelwwSGEVsfYh8bZgqVPvpOm
 NHSQ==
X-Gm-Message-State: AOAM531i3cBhSiXrFTCXzTye4IE6wUG3LAMhiGC7Xl7TVUIV9QEvMRHi
 vmO+3h0SZlY/zFLmfQD52YWWrt/p2b397MFwSLLkYOL2fQA=
X-Google-Smtp-Source: ABdhPJz4lKSONXYzUtGw7rMCS8vsC7LinE7af9hfWUDVkJVWAUuj1p9DmfVEfQaY4QzWaUqc6KSaFPziJPMG+9faMTQ=
X-Received: by 2002:a25:230a:: with SMTP id j10mr20345251ybj.148.1591584518986; 
 Sun, 07 Jun 2020 19:48:38 -0700 (PDT)
MIME-Version: 1.0
From: Ed Tanous <ed@tanous.net>
Date: Sun, 7 Jun 2020 19:48:27 -0700
Message-ID: <CACWQX80QSyf95+ibN24nwiAdNLCtdWOQdsgqaHvVbdEG9b8jbA@mail.gmail.com>
Subject: RE: mTLS on bmcweb
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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

>> I did more testing and found the reason why it accepts any client
certification.

It looks like you never got a great answer to this.

There's a slight conflict between needs here.  On the one hand, bmcweb
needs to support multiple authentication mechanisms, some of which are
compatible with standards that are more or less set in stone (Redfish,
Dbus-rest api, ect).  On the other hand, a lot of people looking to
turn on mutual TLS auth are doing so to reduce the scope of code they
have to "trust" for authentication down to only the SSL library, which
(hopefully) is rigorously tested.  The problem arises here that there
are modes, like Redfish and the webui, that require certain assets to
be available without authentication.  In the case of Redfish, it
requires the introspectable schema files, in the case of the webui,
the static pages that make it up need to be loaded so the UI launches
and the user sees a login page.  (Unrelated note, we make more than is
needed available here, but that's a different problem.)

When I first built the patch to do mutual TLS, my intention was to at
least try to support as many authentication mechanisms as I could,
hence the code you're looking at now that only uses the mutual TLS
auth as a _possible_ authentication mechanism, leaving the final
decision be made by the auth code in bmcweb.  One thing that seems to
have gotten lost in translation somewhere between that code and when
it hit master is that if mutual TLS is the only enabled authentication
mechanism at that point in time, we know that we're not operating in
any standards that would require static assets, and bmcweb can simply
deny the connection on the front end, like you would expect, in the
code that you've already found.

TL;DR;

Add something like this:

// Get the current auth config
AuthConfigMethods& methods =
crow::persistent_data::SessionStore::getInstance().getAuthMethodsConfig();
// if only mTLS is enabled, we can close the connection immediately,
as no other auth methods will be tried.
if (methods. xtoken == false &&
methods.cookie == false &&
methods.sessionToken == false &&
methods.basic = false &&
methods.tls == true){
    return false;
}

Here:
https://github.com/openbmc/bmcweb/blame/master/http/http_connection.h#L302

...and I suspect it'll work like you want.
