Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1650AE855F
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 11:19:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472SHM3pm9zF2X4
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 21:19:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f;
 helo=mail-lj1-x22f.google.com; envelope-from=karo33bug@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Cq0wHIkx"; 
 dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472Rk6388lzF1pX
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 20:53:49 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id t5so6702934ljk.0
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 02:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9iUrdo3H+QFWoko6O2tcys4fHm2/cHGl6t3XyaoAET8=;
 b=Cq0wHIkxFXtSlKyQRjTCUuSznEdqqtCzGmaCDmWpfQrvmipex/VUqgAWtENQ2MLXy2
 YOeMWr2ylCV3T6Ise64fm250/fKnf0wrGNSn1VlNQ1b96DNOohwpK+iJqdC3xCZNttXe
 ht2w8MwknNXpHo5ulu45Fzf2mgWyFv6WIF2Icirn53F2v1D2JSpZPUwBeTe7YYdHtYkh
 AF/PWhJXvXgJAu62z0P6zCkJ8TeDg8WVh1UC9SSVsLV80rbdxSjKVqIkfLUpaWDRDSDP
 HXBR8Lqfg8Kxbnr53pLrpOBlysXdQLBhR47lGqnZb9EOuNA0OxIOWk4NlDUo9lcRBby9
 Hyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9iUrdo3H+QFWoko6O2tcys4fHm2/cHGl6t3XyaoAET8=;
 b=LpHBKmJiomJ3GjkB2oSrzjAqhHfm0nBhQOpkcGrYWmPeehBMoZKiuQ+QB5eOCJ1mDO
 MuJt0opyMwRY04fbkhJQNioPC79Qtqtg62URJcvIEbFSYbPGdq9YAS9NoehUSGG/Y+uJ
 /GzcwIQ9q9gSbcdjzSXpfbLBcv3A0bXjjJdrj6ZoUTZxjYxCiFdIDrlPgTlyQjoN7ylu
 ihTlX01wyQoAVyvX4DoHSkQ0Cgr33k0hKUwKcArmHXgX3sDqmOWM5fOLKIdNvJgqmsNW
 HUPLIwiA2Pb0UNU1kaACNXcJIABPaxr5595JOm98PlSP79I2sA8hUntCuQlxNVPuJPkx
 +haA==
X-Gm-Message-State: APjAAAV/j1PpJoGGmnPtmECBl4RMg5011DCRLi1ROKDCjPyuL5SNHkqa
 nIrdQTyqoPJq798z5F5IoAKpG7tFPWuQjG+BW+/+qA==
X-Google-Smtp-Source: APXvYqxdJZmP27+gP5H7Moyg559F0CCIMw4mIxp20sl2wp0JHaSmRzySIMxMCo8hfbxqMzUz1oqlpYKb6Qb6xDArliE=
X-Received: by 2002:a2e:3919:: with SMTP id g25mr1920026lja.232.1572342825290; 
 Tue, 29 Oct 2019 02:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <CALzeG+989c4bQ-JQRjCV2g_zTKgDHpByJ_G-PsasZMqsg+__Lg@mail.gmail.com>
 <a7c7c24e-4711-4890-7c1f-ea57c3a3eebc@linux.intel.com>
 <3600C284-3968-4278-84EC-C7DF39D5BC88@fuzziesquirrel.com>
 <e514cc74-ecf5-7137-cf60-3a44ce7ed298@linux.intel.com>
 <D2F9CCC1-AAB3-4365-9C5A-E4764D7D099A@fuzziesquirrel.com>
 <3879e352-3d6f-6742-b94c-678b6ba7e286@linux.intel.com>
 <38183aaf-4ef9-a8b0-8394-95f86dabcbbb@linux.intel.com>
 <7CB62B71-B5AC-4482-A67E-D2951638BC1A@fuzziesquirrel.com>
In-Reply-To: <7CB62B71-B5AC-4482-A67E-D2951638BC1A@fuzziesquirrel.com>
From: Carol Wang <karo33bug@gmail.com>
Date: Tue, 29 Oct 2019 17:53:34 +0800
Message-ID: <CALzeG+-UCzP9EgiTGprSmCx91thqwVH=Us=RirACx4AWRqRUVA@mail.gmail.com>
Subject: Re: Could someone help to review bmcweb code?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="000000000000911099059609978c"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Puli,
 Apparao" <apparao.puli@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000911099059609978c
Content-Type: text/plain; charset="UTF-8"

Thank you all for your quick response!
I was thinking if this commit was missed. Now I'm sure I'll be more
familiar with the reviewing process.

On Tue, Oct 29, 2019 at 2:55 AM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> > On Oct 28, 2019, at 2:49 PM, Puli, Apparao <apparao.puli@linux.intel.com>
> wrote:
> >
> > Yeah, on it.
>
> thanks AppaRao!
>
> -brad

--000000000000911099059609978c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you all for your quick response! <br></div><div=
>I was thinking if this commit was missed. Now I&#39;m sure I&#39;ll be mor=
e familiar with the reviewing process.</div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 29, 2019 at 2:55 AM=
 Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com">bradleyb@fu=
zziesquirrel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">&gt; On Oct 28, 2019, at 2:49 PM, Puli, Apparao &lt;<a href=
=3D"mailto:apparao.puli@linux.intel.com" target=3D"_blank">apparao.puli@lin=
ux.intel.com</a>&gt; wrote:<br>
&gt; <br>
&gt; Yeah, on it.<br>
<br>
thanks AppaRao!<br>
<br>
-brad</blockquote></div>

--000000000000911099059609978c--
