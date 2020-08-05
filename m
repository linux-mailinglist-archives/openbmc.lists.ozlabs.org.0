Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C7B23D43A
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 01:43:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMSqc73cQzDqhm
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 09:43:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=jasonling@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=imjrAGWI; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMSpt3XYVzDqgr
 for <openbmc@lists.ozlabs.org>; Thu,  6 Aug 2020 09:42:46 +1000 (AEST)
Received: by mail-ot1-x32b.google.com with SMTP id v21so27498528otj.9
 for <openbmc@lists.ozlabs.org>; Wed, 05 Aug 2020 16:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=BkflBEFReIZmAdhN08K/xHYM0EZGp5PG1/sH/ZMoz3I=;
 b=imjrAGWIfIthlEcL2DgEQWFSaISNuohy75UY5o4fmqK20kIyPhGdPjGMB/rU1CiDg/
 MJncGpnzt5Or0Xig52Ccu+7TdXkyGSoywIIxy+XujBVs4g2/ySTWXHPirTrZ/4TOPyNp
 MyWPmzB5j4zffevhodlT9x9jYzfT44iydnadMfrJ3rn3Rb7FSzOvaCKPQEDEajL56e77
 9+OlZ3YUWFuZC77llVH/b4Hv1t/yBvdjJBkiJNQWye1qABr+UiHCih1n+gVWypEFZY/o
 9NhDrukK+JHTa9Kxqy/GM5uB94i/K3LNtAwaE86Kb/vAlAFuUyn7F3cocHV/itxB4zwC
 5rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BkflBEFReIZmAdhN08K/xHYM0EZGp5PG1/sH/ZMoz3I=;
 b=UuOja7Vah+zaHEx9g5SoPMeJ2bfKitxz4Ujxvgx7wOyW9W+XPfX5ztHJkntcRCu0i/
 4N3/47WTrfWPen589ori2ffz2y3UmQdHmYDZ2SAnMhEk0ULuLs78lDOZvXZo2S6xHuXZ
 UeLHTcQhVSloKTlLZNlDS7YFAULEKO/QKcPexfGbUhkxMSR/YOPfQJitMs2Po/vdq2L4
 sWUatIMRwAcXi9JB2YV83ANKXrIXuCLC0cI7FXz+bTsQ8IMiRJjkroVc8RjpJZFsq+Wq
 T7c3dNn3L6dNZvadrhJ8YsbPk1U4WmH5bJXutZJzhZL7WOHZUcUg9+LUFjY7IO3t+63/
 zTvg==
X-Gm-Message-State: AOAM530EGHidtfOzCI3KttprqA6z2vV4xXLkN1CVUOx1elhLffBiykqw
 mbGSh+2VSQz913jYMOEezIsCjlx2nohFixQPUlu5Wwgity8=
X-Google-Smtp-Source: ABdhPJz+CHNCalS6hM4YCcOKE+FUCsLjyoHa1+N7cArqzSrGDfD11V0gEUnpeAg6EbfOpY8jcDYo7XlQSe4Z34/WNsA=
X-Received: by 2002:a9d:450a:: with SMTP id w10mr4956256ote.327.1596670962377; 
 Wed, 05 Aug 2020 16:42:42 -0700 (PDT)
MIME-Version: 1.0
From: Jason Ling <jasonling@google.com>
Date: Wed, 5 Aug 2020 16:42:06 -0700
Message-ID: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
Subject: dbus-sensors:hwmontemp: additional attribute proposal
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000089914c05ac29ed94"
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

--00000000000089914c05ac29ed94
Content-Type: text/plain; charset="UTF-8"

*Problem:*
There is a use case where temp1_input should be omitted from being exposed
to dbus.
A concrete example is if you have a temp sensor with 10 channels but only
want to expose 2..10.

Currently dbus/hwmontemp doesn't allow this.

*Solution:*
In order to maintain backwards compatibility I am proposing an OmitList
attribute that hwmontemp will attempt to retrieve.
If the "Name"s of any temp sensor appears in the list, it will be skip
sensor creation.

I am proposing a list to support other use cases such as...

* you're doing BMC development and for whatever reason want to temporarily
suppress a temperature and do some tests..you can add it to this list and
then remove it instead of deleting and re-inserting.

* lets you have non-contiguous temp sensors exposed (e.g temp2_input,
temp5_input, temp7_input) . There is a better solution to this; but for now
this enables this use-case.

*etc..*
It's a simple feature; plan to have something within O(hours).

--00000000000089914c05ac29ed94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><b>Problem:</b></div>There is a use case where temp1_=
input should be omitted from being exposed to dbus.<div>A concrete example =
is if you have a temp sensor with 10 channels but only want to expose 2..10=
.</div><div><br></div><div>Currently dbus/hwmontemp doesn&#39;t allow this.=
</div><div><br></div><div><b>Solution:</b></div><div>In order to maintain b=
ackwards compatibility I am proposing an OmitList attribute that hwmontemp =
will attempt to retrieve.<br></div><div>If the &quot;Name&quot;s of any tem=
p sensor appears in the list, it will be skip sensor creation.</div><div><b=
r></div><div>I am proposing a list to support other use cases such as...</d=
iv><div><br></div><div>* you&#39;re doing BMC development and for whatever =
reason want to temporarily suppress=C2=A0a temperature and do some tests..y=
ou can add it to this list and then remove it instead of deleting and re-in=
serting.<br></div><div><br></div><div>* lets you have non-contiguous temp s=
ensors exposed (e.g temp2_input, temp5_input, temp7_input) . There is a bet=
ter solution to this; but for now this enables this use-case.</div><div><br=
></div><div><b>etc..</b></div><div>It&#39;s a simple feature; plan to have =
something within O(hours).</div></div>

--00000000000089914c05ac29ed94--
