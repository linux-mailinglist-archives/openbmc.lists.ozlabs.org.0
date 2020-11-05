Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BC62A8843
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 21:43:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRwTH0nXGzDr7x
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 07:43:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EDvA0v8q; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRwSV5czkzDr6w
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 07:42:34 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id u18so4218468lfd.9
 for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2020 12:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=V+RtMLqV4fEjcJxwyxG/MoMXkLEbvdsFGvavxpwFpSs=;
 b=EDvA0v8qbeMZGaLIm0s0EnQTCstIR9XoHXk7nGnLN3jdtu7a30vcJ++SzX1vJL3454
 t0DjVAupgO2sluGcguVGIqQHvEgg3LHciXYOTvCqvgpGp+3GyokmRuI9A8gvkG4qQsKv
 StldoaVvTl6NA9CpL0aaSBZAXSdfvvbxNE4fYPqMcB6z4NsLoUoKPa7b63S5pbaaP3rj
 S1QaBhKBV2I+9vUZXtbnIYAAKD1dkkNIpXGhKJN2X9PQp6LZbMPyOiarZSumprejOXMQ
 CyB/Clondnvgz0w19671P0On72pqcyq9Vp5s+BIrenh6LwQmq3X6FCz8b0TYCHNjwgKY
 4LWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=V+RtMLqV4fEjcJxwyxG/MoMXkLEbvdsFGvavxpwFpSs=;
 b=q5yVAgLvnjvAGUPKsaCEsk5u75Mpa8PWaST4KwJt2JcmcfdgftQsOPiguNG1oTt+J2
 Nx2+viRWueiue4dJ2h6OZXTT7SIYWHwv+uF5qaCKYqki9OgFbXkTq6lx+bw6NjY7AmzX
 hbEKyToeNTH0zju2ZWsg8Hul6zg7kH2P11mOXsuyWHxrfiB6HpHi93uZsPc653FO3H3w
 20wHr1MB892brriEyaKEOhl6E2Me2mobqbDzWGTYkou3zKpDDTBSG9AyPSxoqN4VDCFQ
 ioAnlF/yNicrTxSzggqLIo8QpckFbdyTGQY2MUbi1cesx/MZyfxWmoqd8OIx7PBOUBcC
 B4Yg==
X-Gm-Message-State: AOAM531jmwpApfCP2+EE5kPCkVvviyV1fxYfCJEa6Y1p3PfserSeoqfF
 3tW6raPhTQcVFPz3SO3PlpLkAcinQyfYjzh6aVw=
X-Google-Smtp-Source: ABdhPJzwZPgbkVw02mztSAwLsOj7awCoLVYc3KzK0tgtjaoWQMVjmL0BGcBkoWh6Fe99j/HyNTLSXCXciKJ39xrdufg=
X-Received: by 2002:a19:6b0d:: with SMTP id d13mr1557617lfa.485.1604608947928; 
 Thu, 05 Nov 2020 12:42:27 -0800 (PST)
MIME-Version: 1.0
References: <CACSj6VUNsH5c=de2xmNq-KhP9q76xV_BPw8o1JZ72DaKjOi2ww@mail.gmail.com>
 <OFD37A2AD5.BA39933E-ON00258617.005D770D-00258617.005EC23F@notes.na.collabserv.com>
In-Reply-To: <OFD37A2AD5.BA39933E-ON00258617.005D770D-00258617.005EC23F@notes.na.collabserv.com>
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Thu, 5 Nov 2020 23:42:16 +0300
Message-ID: <CACSj6VUEqzr04sdhDghyL8AWekDyO0iScqa86hqm69EAa=mRdA@mail.gmail.com>
Subject: Re: Dynamic layout for the Serial-Over-Lan window in phosphor-webui
To: Derick Montague <Derick.Montague@ibm.com>, openbmc@lists.ozlabs.org
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

Thanks for the reply, Derick!
But it doesn't really answer any of my questions.
I understand that the 'webui-vue' is a future of OpenBMC, but
currently some systems still use 'phosphor-webui'.
Can I create a commit for a dynamic layout for a SoL window in 'phosphor-webui'?
If I can, what is preferred?
-getting rid of fixed layout completely as almost nobody seems to use it anyway
-create another JSON option like "consoleDynamicDisplaySize" for a
dynamic layout

I didn't tried 'webui-vue' myself, but from looking at the code it seems like:
1) it doesn't use any JSON for a fixed layout (one more argument, that
these JSON parameters are obsolete);
2) it doesn't re-fit terminal on window resize, so it seems like the
problem should persist here also in some way

Best regards,
Konstantin Aladyshev

On Thu, Nov 5, 2020 at 8:15 PM Derick Montague <Derick.Montague@ibm.com> wrote:
>
> > I was working on a Serial-Over-Lan layout in a phosphor-webui. For me
> > it seems horribly broken
>
> > I came up with a solution where a terminal window resizes according to
> > the window changes.
>
> I agree that the SOL layout in the phosphor-webui GUI does not provide a
> good experience. It was also noted by Patrick Williams that the font stack
> being used also did not provide a good experience. To that extent, IBM and
> Intel, working with other community members that regularly attend the OpenBMC
> GUI Design  Work Group, collaborated to improve the SOL and KVM over IP
> experiences in the webui-vue GUI (www.github.com/openbmc/webui-vue). The
> experience of the web based terminals are consistent and significantly
> improved.
>
> SOL: https://github.com/openbmc/webui-vue/issues/25
> KVM: https://github.com/openbmc/webui-vue/issues/24
>
> We have provide details on the reason for creating the webui-vue GUI
> in the repo's README: https://github.com/openbmc/webui-vue#webui-vue
>
> Thank you!
>
> Derick Montague
> IBM Cognitive Systems User Experience
>
