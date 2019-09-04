Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE94A873F
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 20:21:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NsbM5TjRzDqxQ
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 04:21:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=yuenn@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AGcJSRBM"; 
 dkim-atps=neutral
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NsYx4ndXzDqx0
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 04:20:18 +1000 (AEST)
Received: by mail-io1-xd2b.google.com with SMTP id p12so46392449iog.5
 for <openbmc@lists.ozlabs.org>; Wed, 04 Sep 2019 11:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=GMoKW/TVR0g0VumJcAbmNSdbLlQhm4L8p470/9peTe8=;
 b=AGcJSRBMYdPWATlWVQBCTUNV9KeJ8c3aR6O53zeXu2fTMptoiBuQZoIsC5qHdnUqgO
 f3O01ckEGkP9oqgf78I0M676xuitbOAou1fzqjSWyMGarUCtAlRwkelGq8o48v5Ldjs0
 sCLyA8M+jShi9Bxfon+HxGdhKtUTSNTDqX6HBF5PRpgTLKnFo6jbdy2d+eHJ3pm5HDyV
 9wSCX22isLJTN8HuEnjaByILqud8+xFcLLAIoM2hLkpqGPxbLwzAAwdqkK+/9elkTtDU
 uV4LnO33KLlXGD6Z7FTYOOGo4hY2Ohob4pC6wW4npvyqxz8cMjllEMyeoBtBqjjAU3A4
 Y6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GMoKW/TVR0g0VumJcAbmNSdbLlQhm4L8p470/9peTe8=;
 b=e3Z/pgq7k1ObD6S3GFJbs+aybckwZVmp/9fE8mD1/5I2AHI65672nyMwPdZ7lbDOJs
 F+z1/FBNo3daeHvbDdCQnJR6sW2jjAcQ2trMhIuGUpBBxeHyfguhbTaFq0rmGduDgXSS
 GVGBW8TMzceIr8ePULpXyzmx1hIHiW75uXbH8UFuMtsbJoc1ZtEiBHjWnIV9griLSFp2
 4e0WkKM9G7Een1OZl8ZxPXgCnIiTw1slu6o45+CxO0UXG2f9LRJrgvrKbHMcfHMXJs5Q
 pNrMfdInO7G/xiJwNALlGORlQzsH8cW5ZMRRTJ09p+dGJ0y9ZdVyaudc/OADGr/wB3eP
 K46g==
X-Gm-Message-State: APjAAAV2vq4ZQB4ns7eEi540NMTZ/Jg6A/z/is+2awMb2AlPlBlQcPAw
 vbh4zwUHjwCxZV5/gJY8CqDRdXx7kltbkeYTrJH9CSzJHEs/wcB6
X-Google-Smtp-Source: APXvYqzP+4yhCJOLajFbKdXKBSDsuOfcg8gexP9lOC10NNwW6vEjTCvw6XUMU9zrQfSewYz5mzBmER36B/+U/rGQ0eE=
X-Received: by 2002:a6b:f803:: with SMTP id o3mr6409891ioh.187.1567621215027; 
 Wed, 04 Sep 2019 11:20:15 -0700 (PDT)
MIME-Version: 1.0
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 4 Sep 2019 11:19:38 -0700
Message-ID: <CADfYTpGtEP9_ewuK=DufvkWDmfO1gpyQnvPbC5vy9-+b4p=Hhg@mail.gmail.com>
Subject: Redfish workshop in France 10/31
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000aa917a0591be413a"
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

--000000000000aa917a0591be413a
Content-Type: text/plain; charset="UTF-8"

Free event, colocated with Open Source Summit Europe (search Redfish
Workshop in the page):
https://events.linuxfoundation.org/events/open-source-summit-europe-2019/program/co-located-events/

and here: http://trac.project-builder.org/wiki/RedfishWSEurope2019

Registration required:
https://framaforms.org/redfish-workshop-oss-europe-2019-registration-form-1567095132
----------
Nancy

--000000000000aa917a0591be413a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Free event, colocated with Open Source Summit Europe =
(search Redfish Workshop in the page):</div><a href=3D"https://events.linux=
foundation.org/events/open-source-summit-europe-2019/program/co-located-eve=
nts/">https://events.linuxfoundation.org/events/open-source-summit-europe-2=
019/program/co-located-events/</a><div><br></div><div>and here:=C2=A0<a hre=
f=3D"http://trac.project-builder.org/wiki/RedfishWSEurope2019">http://trac.=
project-builder.org/wiki/RedfishWSEurope2019</a><br><div><br></div><div>Reg=
istration required:=C2=A0<a href=3D"https://framaforms.org/redfish-workshop=
-oss-europe-2019-registration-form-1567095132">https://framaforms.org/redfi=
sh-workshop-oss-europe-2019-registration-form-1567095132</a><br><div><div><=
div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature=
">----------<br>Nancy</div></div></div></div></div></div>

--000000000000aa917a0591be413a--
