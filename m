Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B7422F719
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 19:54:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFnWF31hjzDqYt
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 03:54:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=suresh.11v@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZHCKnPA/; dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFnV11pnJzDrgk
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 03:53:28 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id w17so12966323otl.4
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 10:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KvyeMSJTVRyJqkBhlc+iHwsoVwrXNCO7xvBRQzvg8P4=;
 b=ZHCKnPA/ybjcsgQLp/U42JisZpeb4LjlM7iKPO9n8HPO1iYk0C5rU85jefP5Tg0NxO
 1kLRdOFbHgnG9BzMj0hUMkcY8Lvtg9UWx3Mg5OUtuUdk/uautpAoBcEL49EgWGo6NcKa
 zKD9Z33uxGb0yvobLSg2B6PdyGdb8bNEJ7uaLk2vZ80Sr1MK36h5Ud4kn97wOqiCKe0F
 Acko6gEqs72Dvp/b2eBEIqsm0V5AvzwtXdNkJ3kBFEcCjW/6K6+GKLZdACZt04wjeNjG
 mT5wVJsJXOH7IQNvhJmtG9B5ESAwkmket8Ki0i83kWok0LH9E5LzBaDopbl7O8Fsm2MD
 rXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KvyeMSJTVRyJqkBhlc+iHwsoVwrXNCO7xvBRQzvg8P4=;
 b=t6d3MbWQZZJifSYYFAUakuzW6PboyNGH5zRKsfkXsYfhwLKUaepmKhQLEeiQYUp7mi
 ZqhMDGlWTvRyy0QXC6Ll1G+9gCFr0/qyse+R8DCazj1ibezkiuC8tDr9b4DscQpX/jyo
 5FCbdGt0QLrAdivxMRDYZjOEeztHrpaqdD58pCB0SS7Nmxy58dG4embrKMZLz5rnBaSy
 Zlb2c/31Qg2oWwGdARiBP9tqF4ctQdTe8ghmwBVK2m+Lnp7lOfBgnrsTKnNhBjOeoXlu
 KM3Y84woE2Xa2mIphW/ZtJcXPP0bJ9ePKqtBdwM/6DPriN4PwHfLS+mF7Besh/t7arYS
 1VEA==
X-Gm-Message-State: AOAM532Y/92TWSFovanBKyXRCyCffp0jKaACZknZUDWxr0X+pLtvVyWy
 ayfcDgSlasLNbiV2CAjvnudO08+uV3bsfghxYfbcqFCF
X-Google-Smtp-Source: ABdhPJzYDQUfpPlV59TxNNefhnPhgUNxyIgQIw5QAmGDyvhjpPbyQBg/hb88p4pOTudnExVKRI5WLbXRjlThrWOleNQ=
X-Received: by 2002:a9d:561a:: with SMTP id e26mr21828556oti.216.1595872405184; 
 Mon, 27 Jul 2020 10:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAAO56wvAvc-__MdzQriFt4xze1HMRaToozqGL2ephXuMhYJmnA@mail.gmail.com>
 <0f1b14e8-744f-29cb-ff19-470107161192@linux.intel.com>
In-Reply-To: <0f1b14e8-744f-29cb-ff19-470107161192@linux.intel.com>
From: suresh v <suresh.11v@gmail.com>
Date: Mon, 27 Jul 2020 23:23:13 +0530
Message-ID: <CAAO56wvZy+NMYCo085ubDCw3MciW-D7UShE1WuopmQte5NegAw@mail.gmail.com>
Subject: Re: Reg Backplane Inventory Support in Open BMC
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000d1648905ab6fff45"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d1648905ab6fff45
Content-Type: text/plain; charset="UTF-8"

Thanks, I'll check it out and let you know on this.

On Mon, Jul 27, 2020, 23:05 James Feist <james.feist@linux.intel.com> wrote:

> On 7/24/2020 10:28 AM, suresh v wrote:
> > Hi,
> >
> > I'm Suresh looking for frame work support of backplane inventory via
> > side band I2C from base board management controller in Open BMC. If
> > there are any support in case, can you please give me some pointers to
> > start of looking at it?
>
> We created this:
> https://github.com/openbmc/s2600wf-misc/tree/master/hsbp-manager
>
> Its very specific to the HSBP we were using, but you might be a helpful
> reference, or you might be able to extend it. If it seems useful let me
> know and I can move it into a common repo.
>
> -James
>
> >
> > Thanks,
> > Suresh
>

--000000000000d1648905ab6fff45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks, I&#39;ll check it out and let you know on this.</=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, Jul 27, 2020, 23:05 James Feist &lt;<a href=3D"mailto:james.feist@lin=
ux.intel.com">james.feist@linux.intel.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">On 7/24/2020 10:28 AM, suresh v wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I&#39;m Suresh looking for frame work support of backplane inventory v=
ia <br>
&gt; side band I2C from base board management controller in Open BMC. If <b=
r>
&gt; there are any support in case, can you please give me some pointers to=
 <br>
&gt; start of looking at it?<br>
<br>
We created this: <br>
<a href=3D"https://github.com/openbmc/s2600wf-misc/tree/master/hsbp-manager=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/openbm=
c/s2600wf-misc/tree/master/hsbp-manager</a><br>
<br>
Its very specific to the HSBP we were using, but you might be a helpful <br=
>
reference, or you might be able to extend it. If it seems useful let me <br=
>
know and I can move it into a common repo.<br>
<br>
-James<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Suresh<br>
</blockquote></div>

--000000000000d1648905ab6fff45--
