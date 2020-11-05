Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF862A7C67
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 11:55:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRgRR6wqpzDqvd
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 21:55:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=shaikkhaderbasha601@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pCnq0SL3; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRgQT6jyPzDqVb
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2020 21:54:57 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id e7so1176666pfn.12
 for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2020 02:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=7lD/49ip4Exh7waSjixHsjgUABFlJriJ314mM1bUrcg=;
 b=pCnq0SL3H47gQ3D8yAgccVNEeg1+KpxuHsXFaV5mFSXfVDwhAr9p0I9P+Nlfs2Tbxv
 8IUpjq4gogQfVHA25dnK3UkFqkft3MNDHwQYiDwxfYRz8nKhrygiz5b2XXaKuqArADCJ
 N6Uo4vtLjNgOuezLKNMz6KCCdpqJqOy+MgaNimAwIT2SA6untezSRcmD4wGFum/JlxsR
 1UNqKqmwtem3RtAPoF9FUGJ82g4CKAcgMWyBQEZsi94krraKD/BxYGwXwAcZd1Cwuxwi
 abv720YQbI81qB8T/oebXsVxc8UEspS6CAsk+eitl6z4UGziGdJrc7nb9dcHLlqtWjks
 sBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7lD/49ip4Exh7waSjixHsjgUABFlJriJ314mM1bUrcg=;
 b=DaXC+Xog2yZZOdv4JU6evaS5EiAsZZw6gJbH7lE+U07jw0iuxuLmYZs6q3NhTrE9Y1
 esc+O4ESyMmx45sHDPHlojHPx9vQXyKK7JqYy5gniHdIBdTfdOTThnla11M4vueBxUD0
 yzJJryjiYkeEv3kviUOUHKnti/R4YFV1vVrQ2ieW9w9MxkNAwKXIblZasqvh7J1Pdkhi
 ZGgTR2dXc1CrBKSc8NbV1WQTOmOnnxFxwpDY+lk9ia9bLZ+G1znujVcCbFG3o442zND7
 5BI7RpQAws8TP+2liyNz8NxDre260pWzg32/Ylw2U+6fnCVBxVDAT+mU2ADc5Cvb9QIC
 Ayig==
X-Gm-Message-State: AOAM531R+4GMaV+MsVblueLqTWbbc9CnIKHB/A07PuCzu2NmN7byBZwI
 TUF3zZVQW4FzQ9JfMi4SNQ37JRAGQqdvLh2nU2/AHKADLJ3Iew==
X-Google-Smtp-Source: ABdhPJy+efxIhmhqMo+17w81eI4ncgAUrcWjwBjHdIPYk7e9HQ2LWozz2wAZcEgPgTKB5LbjLiGSVmQ0vqL9fjAuwzA=
X-Received: by 2002:a62:ddd4:0:b029:155:af54:3000 with SMTP id
 w203-20020a62ddd40000b0290155af543000mr2065831pff.64.1604573693706; Thu, 05
 Nov 2020 02:54:53 -0800 (PST)
MIME-Version: 1.0
From: khader basha shaik <shaikkhaderbasha601@gmail.com>
Date: Thu, 5 Nov 2020 16:24:42 +0530
Message-ID: <CAD+gp9D8iP5ydF_a0fwXzy7FD-wO5-Pn-=QSKLxPncaB0LhpSA@mail.gmail.com>
Subject: How to update static files in bmcweb(redfish/v1)
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000007853b05b359ed1b"
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

--00000000000007853b05b359ed1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

how to update static files in bmcweb(redfish/v1) =C2=B7 Issue #160 =C2=B7
openbmc/bmcweb =C2=B7 GitHub

I am new to openbmc and need to understand the integration of the bmcweb
static files(redfish/v1) with dbus.
My requirement is to update the static files in bmcweb with my custom
sensor.

For example, I have created a custom power sensor, which is reading through
the hwmon entry.
I can read the power metrics value using the "curl" command through the
"/xyz/openbmc/" path but no value is updated in the path "/redfish/v1".

I  have the following queries:

   1. What exactly is difference between the two paths, "/xyz/openbmc" &
   "/redfish/v1"?
   2. How can we update the custom sensor values to "/redfish/v1" path?
   Where exactly the integration is required?
   3. Does static means these files will not update through sys/hwmon
   entry? If no,, and if we can update, which file we need to modify.
   4. How to integrate hwmon sensor information in /redfish/v1/Chassis/ ?


Any help or suggestions/reference on this would be really helpful.


Thanks & Regards,
Khader B Shaik

--00000000000007853b05b359ed1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Team,<br><div><br></div><div>how to update static files=
 in bmcweb(redfish/v1) =C2=B7 Issue #160 =C2=B7 openbmc/bmcweb =C2=B7 GitHu=
b                                                                          =
                                                                         <d=
iv class=3D"gmail-application-main"><div><div class=3D"gmail-container-xl g=
mail-clearfix gmail-new-discussion-timeline gmail-px-3 gmail-px-md-4 gmail-=
px-lg-5"><div class=3D"gmail-repository-content"><div class=3D"gmail-js-che=
ck-all-container"><div class=3D"gmail-js-issues-results gmail-js-socket-cha=
nnel gmail-js-updatable-content" id=3D"gmail-show_issue"><div id=3D"gmail-d=
iscussion_bucket"><div class=3D"gmail-gutter-condensed gmail-gutter-lg gmai=
l-flex-column gmail-flex-md-row gmail-d-flex"><div class=3D"gmail-flex-shri=
nk-0 gmail-col-12 gmail-col-md-9 gmail-mb-4 gmail-mb-md-0"><div class=3D"gm=
ail-js-quote-selection-container"><div class=3D"gmail-js-discussion gmail-m=
l-0 gmail-pl-0 gmail-ml-md-6 gmail-pl-md-3"><div class=3D"gmail-TimelineIte=
m gmail-pt-0 gmail-js-comment-container gmail-js-socket-channel gmail-js-up=
datable-content"><div class=3D"gmail-timeline-comment-group gmail-js-minimi=
zable-comment-group gmail-js-targetable-element gmail-TimelineItem-body gma=
il-my-0" id=3D"gmail-issue-732010557"><div class=3D"gmail-ml-n3 gmail-timel=
ine-comment gmail-unminimized-comment gmail-comment gmail-previewable-edit =
gmail-js-task-list-container gmail-js-comment gmail-timeline-comment--caret=
"><div class=3D"edit-comment-hide"><span disabled><table class=3D"gmail-d-b=
lock"><tbody class=3D"gmail-d-block"><tr class=3D"gmail-d-block"><td class=
=3D"gmail-d-block gmail-comment-body gmail-markdown-body gmail-js-comment-b=
ody"><p>I am new to openbmc and need to understand the integration of the b=
mcweb static files(redfish/v1) with dbus.<br> My requirement is to update t=
he static files in bmcweb with my custom sensor.</p><p>For example, I have =
created a custom power sensor, which is reading through the hwmon entry.<br=
> I can read the power metrics value using the &quot;curl&quot; command thr=
ough the &quot;/xyz/openbmc/&quot; path but no value is updated in the path=
 &quot;/redfish/v1&quot;.</p><p>I=C2=A0 have the following queries:</p><ol>=
<li>What exactly is difference between the two paths, &quot;/xyz/openbmc&qu=
ot; &amp; &quot;/redfish/v1&quot;?</li><li>How can we update the custom sen=
sor values to &quot;/redfish/v1&quot; path? Where exactly the integration i=
s required?</li><li><div style=3D"box-sizing:border-box;font-family:&quot;S=
egoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&=
quot;,sans-serif;font-size:14px">Does static means these files will not upd=
ate through sys/hwmon entry? If no,, and if we can update, which file we ne=
ed to modify.</div></li><li><div style=3D"box-sizing:border-box;font-family=
:&quot;Segoe UI&quot;,system-ui,&quot;Apple Color Emoji&quot;,&quot;Segoe U=
I Emoji&quot;,sans-serif;font-size:14px"><div style=3D"box-sizing:border-bo=
x">How to integrate hwmon sensor information in /redfish/v1/Chassis/ ?</div=
></div></li></ol><div><br></div><div>Any help or suggestions/reference on t=
his would be really helpful.</div><div><br></div><div><br></div><div>Thanks=
 &amp; Regards,</div><div>Khader B Shaik</div><div><br></div></td></tr></tb=
ody></table></span></div></div></div></div></div></div></div></div></div></=
div></div></div></div></div></div></div></div>

--00000000000007853b05b359ed1b--
