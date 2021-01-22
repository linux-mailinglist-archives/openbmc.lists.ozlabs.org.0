Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C641D30032F
	for <lists+openbmc@lfdr.de>; Fri, 22 Jan 2021 13:34:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMdxp6C0YzDrQb
	for <lists+openbmc@lfdr.de>; Fri, 22 Jan 2021 23:34:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92e;
 helo=mail-ua1-x92e.google.com; envelope-from=deepak.kodihalli.83@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q3QpB1Jg; dkim-atps=neutral
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMdvc3C41zDrQG
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2021 23:32:56 +1100 (AEDT)
Received: by mail-ua1-x92e.google.com with SMTP id v23so1760721uam.8
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2021 04:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YjnZMNW5nWC4U+eHQW5REKuiYG0/oC3hVjKzx3ikgCc=;
 b=q3QpB1Jg39Nvry5xqnekVHkxPhXHc0K0wlMe0y2zNqR1+36rfr7U5IsZuyKaAPbkKU
 szRBlbPYzJD3pQOevzJ9ggLIsZaQqwcoJ3HewhXPWjshV1lerh6KAQPzkqucr9EwNTE2
 KJ8vYfoT/glF1QLsv8ya/F+QslEtUGf3dD9/kYhhfyedNKzfYq0MSc/4Tw4GScywYSBu
 gVrv4Vx3pb6jEVTFdmc3B7R6urVnjKy1Sof7hmoR2ZutVNw4h4R4egdOvluGEmpl52yx
 9PWsrJAEaHl0d+U4We9GAlbn24jiA+Ym+AYKumJEimDwwgZ77ztejjW6qz/ArnnxZHOy
 4vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YjnZMNW5nWC4U+eHQW5REKuiYG0/oC3hVjKzx3ikgCc=;
 b=fFtCqNqTP4YvjKeCfaSeh+F2NeMGUniVLK3PaWLhih6fN0Af04zDlqE4cto+4VbWUa
 wwmrquP6cqhKzh+3fHl9PrLd9m67mQ6wWCTZe29EdS7moulzzwPy52blet40U4DnZvZ+
 qHfjB4O8hXjM4/MV62G3ymf/UvwoNMwYNVGIb2U6rUJlLWddgfeulKl7SPFFSQqkTV1u
 jM7w1XX1TUBernOAHOE+UuPUL1ZcWatnXM7DiTAGlIAXNEdaPJr6Jq84NDu5L1dnzs9m
 1eYAImynh50NRq7k7o5xygiGP/lIJMpYSsZgNzrsjvTwzS1uRC1I3OOGuCZkuxBEdagV
 K5rA==
X-Gm-Message-State: AOAM5337FPMwlR5rBOLjFQsCcrcjfy1zMX2JNl4OoIkROUzcUb+mPngQ
 vM2to20uTSPOBvwg0ZNMwASMeAy6xVGMXXeazo8=
X-Google-Smtp-Source: ABdhPJyVyKMj8h/lpxIbiVw8Iy5hgIBNFFDulQiGDkq1svmvZFK8jAifeV7LMRqX21KQUWq6LmlA3snVJF9Ye+YyQG0=
X-Received: by 2002:a9f:37c1:: with SMTP id q59mr716833uaq.78.1611318772857;
 Fri, 22 Jan 2021 04:32:52 -0800 (PST)
MIME-Version: 1.0
References: <4795347F-477D-45EF-A145-0C7B163FE01B@getmailspring.com>
In-Reply-To: <4795347F-477D-45EF-A145-0C7B163FE01B@getmailspring.com>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Fri, 22 Jan 2021 18:02:41 +0530
Message-ID: <CAM=TmwXEmFc95mBEg4G8bUNoBq7qDL9i_vv=YtomRDrVPDYBEw@mail.gmail.com>
Subject: Re: Progress Codes in BMC
To: manoj kiran <manojkiran.eda@gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Manoj,

On Fri, Jan 22, 2021 at 5:25 PM manoj kiran <manojkiran.eda@gmail.com> wrot=
e:
>
> Hi All,
>
> IBM Servers has a feature called Progress codes[1]. These are generated b=
y applications on the BMC & host to show their progress via the standard in=
terfaces like GUI & control panel [2]. These progress codes are used during=
 boot hangs e.t.c to provide additional detail as to how far we made it wit=
h respect to boot.
>
> Does the community has shared interests on this & would like to collabora=
te ?

I am interested in this problem as well and would like to collaborate.
OpenBMC already seems to have solutions for POST codes -
phosphor-host-postd, phosphor-post-code-manager and there's a
Boot.Raw.Value D-Bus API. However it would be nice to have a more
generic solution. I think it's hard to converge on the format of such
codes (since they can originate from different layers of firmware
stacks/bootloaders and some of these layers might not accommodate
PLDM/IPMI etc). What I mean by generic above is:
- A generic D-Bus API for progress codes
- A generic app for managing the policies around such codes
- Platform specific "Producers" of progress codes, conforming to the
generic D-Bus API
- Redfish mechanisms (LogService/other) to extract codes

Maybe some of the apps I pointed above can be extended for this
purpose, but I'm yet to take a closer look.

Thanks,
Deepak
