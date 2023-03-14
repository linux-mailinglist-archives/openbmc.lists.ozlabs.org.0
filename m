Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 733756B8C15
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 08:37:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbQNj27w3z3cLh
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 18:37:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=U7pR+CnG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=U7pR+CnG;
	dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbQN66MvPz3bgW
	for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2023 18:37:24 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id j19-20020a05600c191300b003eb3e1eb0caso12447296wmq.1
        for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2023 00:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1678779440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6S15GBcZYo+MiJUP7mKDjF/hafRP0A6CZsjyyX+0B4=;
        b=U7pR+CnGDfW4Qi1zQ0BzXZMSRsUHRb+rD0oT/AVoMPCM8BBCGByl93F0Uxg52Sp5r4
         V394BH8SZ3w6FOOQgnmctLg/+ivGpN/mvGpX97bbTaN6YzOKwroVagqW7/ilu6GX9AGM
         n00d1sfqm8GtEOfm6qKf6TJ6oXhk75ZU+xhT6+ggXUMWLzyrrDKTgYs1pxacj8zvaakN
         skNX/DGPL/7t4xEbMk33txChMCjmHylZ76T4jZ3W4RBl7hkV+GIGnoHqZd1M/LgwWsri
         pCagbvwTUAD4+20Z0Ful8eZTYpOfoRoVUKYfR61xG4TCaTFfL7hXK+R7kTlYF+ryNnJc
         ZHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678779440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j6S15GBcZYo+MiJUP7mKDjF/hafRP0A6CZsjyyX+0B4=;
        b=JIizsH+fpFlYiHOQX5Qu0NCp/qonihv2AlRffi3Z0H5KuahMmP+C84cHqCr7xjfRCJ
         Nw7AwSPMNNGr952dusFvWnvewV6cGMbpt6omL0x+8eU9BtrkohlhkKN+X+326sYJjpHy
         kLUZS587SZdjKbqxmXVgLLhOxIL74JtZBJ7jvM/otshLiVxsApRuxdf9ji2cqNvZ44zg
         5GqB2mpKb3wBCJEO9+PnMsF2l99tDzFhqxHstsfJh3Sexsmxiur/6rEQx6nvUbaVfKal
         efUUu0Y25tmCMHw4/qV5m0nAmStru9jqEL0B3wvnA8roG+YhSGk01BRIhFOvn9y4GX/Y
         vIGw==
X-Gm-Message-State: AO0yUKXnJPx4w5v9j9CTzq4uVjyeQKymFjTDlMcQet4Nld57UasGMrgX
	InVdg0LtJmUfQERbLgKuCGlpY74dZ7cHJK5FAqLsC++wN+RqBW6ISIU=
X-Google-Smtp-Source: AK7set9ANkxyAAASo8zQXjGqQ8Q1ZMS0eoB/H6azs3GDjrajfDoZHQEKcaIbSOsUq/8YJDTPCjc7WLoGhyYJdlX4LCI=
X-Received: by 2002:a05:600c:a39a:b0:3e1:eddc:e3ae with SMTP id
 hn26-20020a05600ca39a00b003e1eddce3aemr3958217wmb.0.1678779440513; Tue, 14
 Mar 2023 00:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAB7+d-nOMCGdD7upJviTVrWuZ=mW0gyV9G0E4wke8rQstg2zzw@mail.gmail.com>
 <CA+J-oUsaF8rNYYff9QZj8C0iZgHf8+YE=LfPuQ74ndx+XrwAnA@mail.gmail.com>
 <MA0PR01MB6812D93048C946BE907B7DA4F9BE9@MA0PR01MB6812.INDPRD01.PROD.OUTLOOK.COM>
 <CA+J-oUvicuX0sqo0xGkMft3m+KsMbdVivK88r2DeQQunWMK6-Q@mail.gmail.com> <MA0PR01MB68129D4BD8846606B2427036F9BE9@MA0PR01MB6812.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA0PR01MB68129D4BD8846606B2427036F9BE9@MA0PR01MB6812.INDPRD01.PROD.OUTLOOK.COM>
From: Zhang Jian <zhangjian.3032@bytedance.com>
Date: Tue, 14 Mar 2023 15:37:09 +0800
Message-ID: <CA+J-oUtZSnCwFGEvkp5sNcTsuej7hH1GaqJ9B7XY=r2Btoc0RA@mail.gmail.com>
Subject: Re: [External] Running evb-ast2600 image using qemu
To: Ranbir Singh <saini.ranbirs@outlook.com>
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
Cc: David Bashaw <theactualdbashaw@gmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 14, 2023 at 2:04=E2=80=AFPM Ranbir Singh <saini.ranbirs@outlook=
.com> wrote:
>
> Jian - Using the same command as you mentioned, and after machine has boo=
ted and logged in
>
>
>
>
> Also, noted that CurrentBMCState continue to come as NotReady even after =
5 min of bootup completed. Is this normal ?
I think this is not normal,  the state of  `CurrentBMCState`  is
checking the multi-user state( state is active?),
```
 systemctl | grep -i multi
  multi-user.target
                                    loaded active     active
Multi-User System
```
you could use `systemctl | grep -i activating`(I'm not sure to use
activating) to check what service blocked this.

>
> Best Regards,
> Ranbir Singh
>
> ________________________________
> From: Zhang Jian <zhangjian.3032@bytedance.com>
> Sent: 14 March 2023 11:05
> To: Ranbir Singh <saini.ranbirs@outlook.com>
> Cc: David Bashaw <theactualdbashaw@gmail.com>; openbmc@lists.ozlabs.org <=
openbmc@lists.ozlabs.org>
> Subject: Re: [External] Running evb-ast2600 image using qemu
>
> On Tue, Mar 14, 2023 at 1:28=E2=80=AFPM Ranbir Singh <saini.ranbirs@outlo=
ok.com> wrote:
> >
> > Is there anyway to login using the Web UI also when running image on qe=
mu ?
> of cause, the command line forwarded the port localhost 1443 to bmc
> 443, you just need access https://127.0.0.1:1443 in your browser
> > ________________________________
> > From: openbmc <openbmc-bounces+saini.ranbirs=3Doutlook.com@lists.ozlabs=
.org> on behalf of Jian Zhang <zhangjian.3032@bytedance.com>
> > Sent: 14 March 2023 09:02
> > To: David Bashaw <theactualdbashaw@gmail.com>
> > Cc: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
> > Subject: Re: [External] Running evb-ast2600 image using qemu
> >
> > The command that I used.
> > ```
> > qemu-system-arm -M ast2600-evb  -nographic -drive file=3Dimage-bmc,form=
at=3Draw,if=3Dmtd -net nic,model=3Dftgmac100,netdev=3Dnetdev1 -netdev user,=
id=3Dnetdev1,hostfwd=3D:127.0.0.1:3222-:22,hostfwd=3D:127.0.0.1:1443-:443,h=
ostfwd=3Dudp::1623-:623
> > ```
> > For your reference.
> >
> > Jian
> > From: "David Bashaw"<theactualdbashaw@gmail.com>
> > Date: Tue, Mar 14, 2023, 07:52
> > Subject: [External] Running evb-ast2600 image using qemu
> > To: <openbmc@lists.ozlabs.org>
> > I'm new to openbmc but have read lots fo docs.
> > I want to try running an evb-ast2600 image using qemu.
> > I ran the following steps:
> > .setup evb-ast2600
> > bitbake obmc-phosphor-image
> >
> > The build completes fine.
> > I installed qemu-system-arm also.
> >
> > What command line should I use to invoke qemu?
> >
