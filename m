Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 264FD15F959
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 23:23:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K7F93B12zDqmf
	for <lists+openbmc@lfdr.de>; Sat, 15 Feb 2020 09:23:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=peterlundgren@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=K9/hTqSx; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48K7DP3M3dzDqlW
 for <openbmc@lists.ozlabs.org>; Sat, 15 Feb 2020 09:22:42 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9so4221227plo.11
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 14:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=B5Ll3paIGhlex+nPjMriDgvzytt2jow0qJ0yuFE+mOc=;
 b=K9/hTqSxMzhMXIGlKXyyhQL7RfWdkl1kNQqzF/6SJ2EgasxMmeaTddG4EoQxEieugX
 rdmNVwkKtnGjPr5Qhp694HmGOzXwsxxUTV0qVuw6SO8FBB/rgdkPCsct9VN0/qxdDrAE
 V/Nwrx49xuVnsyN+rw6uuXREkrj3s21htYeLdzagVwP08i4HoDD3Pr7AbADoIOaEwzHl
 pp86D0FRuNHkGQpl7HfSo15q4lLzcAei0a3Pbo65mCafAaaeZ6Hx1N/oSBbbukMvA+BV
 AH91MPWnoMOvYQAMlSCdI2MsHfL8vzhqLN3+hKTOZUw/vaYSJZbHNoWb6BznmRqeNYVG
 boDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=B5Ll3paIGhlex+nPjMriDgvzytt2jow0qJ0yuFE+mOc=;
 b=JgO1jdLVClNNpPl6Tk7MUR3xu6lha/w3iJc/HisroFKVpsshGYqAvMizxMP68NQY1y
 +HL8oWPYRuyLwSrFxDrG6Y5x0ilfIvKqOGzVSovQBgftvmGI3vGpp9fSsV4/unfISY0F
 ehTuwWfiAaQXzxi5n1qc0RMUZnGhNvM2b62NUDALrXszcQ65YsJo0nCpS18nuN0USvpQ
 WvqgEKUlGkdIlLBOPOQUatvX56Gp0AesCoDJlBxUJ3aWrKsrIIpWSeBerh6LIPL8is1B
 AmWogXOuYxkyOCiW3suam1z6Z6EY11tfI4RtKFyz8BSUhRINS9JqtPZexTByv1rvgKWT
 0O4g==
X-Gm-Message-State: APjAAAUT8ifUJaVx7uAhzCsrArnhegvWABUCnA1GBQrKAPUjCCVQh42h
 WhcRXQjnarj5+tSQygVgBhuDHkb8ha0PqnavVH57GOQe5u8=
X-Google-Smtp-Source: APXvYqwYrGd8L+aZ9C7ghLXlpT8IKUf7S2GMmbwrHG+i7ksbn6YXuLgK1NUC5gzC1ZGogomoZt6je82W7EKNsVHDwkk=
X-Received: by 2002:a67:ff17:: with SMTP id v23mr2587992vsp.121.1581718510194; 
 Fri, 14 Feb 2020 14:15:10 -0800 (PST)
MIME-Version: 1.0
From: Peter Lundgren <peterlundgren@google.com>
Date: Fri, 14 Feb 2020 14:14:59 -0800
Message-ID: <CAK13xKNkmy5fTgi0xLK=F+fBJbA7EN3bRsinLbN2sTknfiCGwA@mail.gmail.com>
Subject: Performance issue with psusensor / dbus-sensors
To: openbmc@lists.ozlabs.org, james.feist@linux.intel.com, 
 vernon.mauery@linux.intel.com, jae.hyun.yoo@linux.intel.com, 
 Josh Lehan <krellan@google.com>, Alex Qiu <xqiu@google.com>,
 Xiang Liu <xiangliu@google.com>, Sui Chen <suichen@google.com>
Content-Type: multipart/alternative; boundary="000000000000efd193059e908941"
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

--000000000000efd193059e908941
Content-Type: text/plain; charset="UTF-8"

We're running into some occasional and hard to reproduce performance issues
with sensors on the entity-manager/dbus-sensors/intel-ipmi-oem software
stack. I don't have much concrete to say on the subject, but I want to put
a feeler out to see if anyone else has seen similar issues. Here's what we
think so far:

Complaints range from IPMI sensor reads being slower than normal to sensors
"never" updating.

Josh got access to one machine in a bad state and observed this:

   1. All the I2C buses were working normally. i2cdetect ran successfully
   on each bus.
   2. hwmon was working fine. He wrote a shell script to read all of the
   *_input sysfs files and could read every sensor in the system in 3 seconds.
   3. psusensor was running.
   4. busctl --no-pager monitor | grep -i PropertiesChanged shows no
   traffic. On a healthy system, it shows many updates per second. No obvious
   error messages in journalctl --no-pager -f.
   5. Restarting psusensor alleviates the problem.

--000000000000efd193059e908941
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We&#39;re running into some occasional and hard to reprodu=
ce performance issues with sensors on the entity-manager/dbus-sensors/intel=
-ipmi-oem software stack. I don&#39;t have much concrete to say on the subj=
ect, but I want to put a feeler out to see if anyone else has seen similar =
issues. Here&#39;s what we think so far:<div><br></div><div>Complaints rang=
e from IPMI sensor reads being slower than normal to sensors &quot;never&qu=
ot; updating.</div><div><br></div><div>Josh got access to one machine in a =
bad state and observed this:</div><div><ol><li>All the I2C buses were worki=
ng normally. i2cdetect ran successfully on each bus.</li><li>hwmon was work=
ing fine. He wrote a shell script to read all of the *_input sysfs files an=
d could read every sensor in the system in 3 seconds.</li><li>psusensor=C2=
=A0was running.</li><li><font face=3D"monospace">busctl --no-pager monitor =
| grep -i PropertiesChanged</font> shows no traffic. On a healthy system, i=
t shows many updates per second. No obvious error messages in <font face=3D=
"monospace">journalctl --no-pager -f</font>.=C2=A0<br></li><li>Restarting p=
susensor=C2=A0alleviates the problem.</li></ol></div></div>

--000000000000efd193059e908941--
