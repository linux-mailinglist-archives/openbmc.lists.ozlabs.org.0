Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE4AE5443
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 21:22:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 470DX90tj8zDqsG
	for <lists+openbmc@lfdr.de>; Sat, 26 Oct 2019 06:22:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EUs+YyV7"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 470DWV2slrzDql5
 for <openbmc@lists.ozlabs.org>; Sat, 26 Oct 2019 06:21:57 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id 21so2213061pfj.9
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 12:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=l6KEVKDjsGGQzpvWoLdJxOk4QaJhtqh49khDZv4xRtk=;
 b=EUs+YyV73V8jq2BQR70EeYziHmjXEi8iEeiMVbfNelz+EyimMHsg2EW0i+zl6epztv
 f9ah55USFQOLtRIerNi+sy7BPulzC48SYrZNbSDSW82U52D2eF45s5v4ahDOjIsacbjV
 m6w7zSdgdjl+QehKl7cPSDf0IsIH/yJPZolAO9PpZ7yhfpxCDkYNROwutdLdq3wE0lJ8
 vIytjOShOJX2Ohhjjl6z/feFjZsjK++NYU3N7/jPHTDHV9wikWvA71qaQdauQyXkBFfP
 ZL00SJdSQCCRjH4WsxyaqnwpOst2OFTJLDUBAvZUwSy2AX1PGic4OWa0gNIXqqbhOxmq
 Y8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l6KEVKDjsGGQzpvWoLdJxOk4QaJhtqh49khDZv4xRtk=;
 b=sROJmWBUXYAX3oFKuaRrufnNlRt6CirZ06caMUVt/MdqpmDjEBwIFbDuDVOu1ACTsq
 p3O3pkd5NiCLuKNQY18MbXsVHiEMIwabogEbsG4kkZ0/rvLrrX75I+h+BDeSs2+BsLt8
 i1vWogMiurFeYe2kJI2NgBZInWPFAt730TgIMJ+9hCPEMXmPldlh0QoqYitGgYQ2rw+d
 ZFhdLojVOY3dJlfX2l7Hpk/V3nYk49YvPe6sXDPsOhuPC0/CZ+2hv0sk8vnrHIZhHG8L
 xSar1IfwAjjYav3aCpU1em7xuFMrvDcF3l8bymCGGKZG9uwBaCXl9yhC6TcmrVHhJNNB
 9yXg==
X-Gm-Message-State: APjAAAVRbgd6seK8yNMIl6LzJJCT5W3Ia3Nn25D933pIxfMCu+OAtB6D
 MGOYynT81bxgZDncUKLsEx+ewMDSlm/JcMqx0qoKbA==
X-Google-Smtp-Source: APXvYqwp9DFdDWs9ZZ5tXQO8iHF0edV1MVKVI9cujDC1pw/IAcKphfGKlmtl6/7SWfu7ApUTY7V/7Oerj44WYX8MKFc=
X-Received: by 2002:a17:90a:5896:: with SMTP id
 j22mr5927074pji.55.1572031313552; 
 Fri, 25 Oct 2019 12:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <8371D980-4DCC-42C3-9BFA-4DB7C9475D80@fuzziesquirrel.com>
In-Reply-To: <8371D980-4DCC-42C3-9BFA-4DB7C9475D80@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 25 Oct 2019 12:21:42 -0700
Message-ID: <CAO=notxJ6NttiqdXV=yCJLUZeZp=161k8GefayrjRPHhC_JRGQ@mail.gmail.com>
Subject: Re: consolidation of *-dbus-interfaces
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@gmail.com>, Yong Li <yong.b.li@linux.intel.com>,
 richard.marian.thomaiyar@linux.intel.com,
 James Feist <james.feist@linux.intel.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 25, 2019 at 12:17 PM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
> Hi everyone
>
> I=E2=80=99ve discussed with a couple people off list the idea of consolid=
ating all the dbus interfaces into a single repository.  Today there exist =
four:
>
> phosphor-dbus-interfaces
> openpower-dbus-interfaces
> ibm-dbus-interfaces
> intel-dbus-interfaces
>
> The idea is that going forward all dbus interfaces would just go in phosp=
hor-dbus-interfaces regardless of the namespace.  That should cut away a lo=
t of complexity in the bitbake metadata and in other places as well.
>
> Is there any opposition to this idea?  If anyone is worried about maintai=
ner-ship, I am working on deploying the owners file plugin on our Gerrit in=
stall which enables kernel style ownership of different files depending on =
path, regex matches, etc.
>

Cool beans.

> I would guess there would be a desire to configure (as in autoconf) in or=
 out different namespaces.  Am I correct in that thinking?  Any thoughts on=
 how exactly that should be done?

Probably PACKAGE features via bitbake to pass down the enable the
things you want -- by default enable only phosphor-dbus-interfaces.

>
> On a somewhat related note I tried migrating phosphor-dbus-interfaces bui=
ld to meson and failed miserably when I got to generated sdbus++ header fil=
e placement.  If anyone has any ideas on how to do that I=E2=80=99d love to=
 hear about it.
>
> thx -brad
