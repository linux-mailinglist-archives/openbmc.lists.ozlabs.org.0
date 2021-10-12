Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5B842AD5C
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 21:39:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTQwM2mbFz2yPj
	for <lists+openbmc@lfdr.de>; Wed, 13 Oct 2021 06:39:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=o+bmKqng;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::429;
 helo=mail-wr1-x429.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=o+bmKqng; dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTQvw4Slwz2yPs
 for <openbmc@lists.ozlabs.org>; Wed, 13 Oct 2021 06:39:06 +1100 (AEDT)
Received: by mail-wr1-x429.google.com with SMTP id g25so763327wrb.2
 for <openbmc@lists.ozlabs.org>; Tue, 12 Oct 2021 12:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OIb8PISce4jApL4Qx+7UXG0+Kddv4D3x8hZpRdjZ4xo=;
 b=o+bmKqng4rS4zGwf/00vsc2Cy9nUu7ZcFk/CMUnRu0lL1LjBlw/5IbfkvhUDUSy2RV
 KCuXoyYqIy4m77urcww/s0ixcjVwOSvI9nxjsd7n60YIHdby3vKfOf0NXmF9BTWesgmW
 LbwD3PFmc/l3FAKaC+uOB1Aow5+vxk7GgSN2tdavgO8WvmluDk9JdPLrKnpptR5UfJVm
 LTt50WHyZp3POorcoKslrOFg+AX2Zmoqx5uwnyXLanTm3QDJa1ov3WSa20QINPCSO/hj
 g5CIAsl6pzkNhHh9gSyYeOEAzDRyAVI8BDiv3hRl4MKUSnw46R+GayRH8y75Mx3G5sgg
 Mc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OIb8PISce4jApL4Qx+7UXG0+Kddv4D3x8hZpRdjZ4xo=;
 b=8FvkdME7zyMt08TFoVLK/K0B3nM+AzMIk8tjkPOI052MruaDf6uyf5jNa68ffSlD3y
 BEMdOAq8QFNy19gzVhIXIIOHTrnkLWL9tAL7IJv7CCS/UeS/esFbeRyFrP5cj3BfC+M2
 Id4qusV6o0XEU58OnMWPi+RRQfNguDRX6jXYCNxekPqHVv8uGa10plkmZUIUF9nvdajK
 sUSCB9/qOdaGz60biQxrHnZBKyQcxf5vKr2GDm4eCU7ozpCWvRol/KCH+Vk+DJVXEYP3
 08bmF0IU5TGiFyw2ZWxZZn9xoSEF3zChhoJSpUUAv2FooUTkAa+tfzUgQ6zwNlMeqODn
 Zklg==
X-Gm-Message-State: AOAM533F/QML4JLsAjiuBRjQ9hEND5N6753EuOkJU6RbGEaqXqNN8Gq9
 jLdR4lVKVHt9TLUlWd13wbqIEJbl4UQ70SRt6m3nmw==
X-Google-Smtp-Source: ABdhPJyY0Joy126v13Nb0jZdys/QV7MHtsCDwZ3ODJUi8CefAW8e2dUnvK6jet5g3aHEgPi7/ectQRN4FGHT6NDioHc=
X-Received: by 2002:adf:a3c3:: with SMTP id m3mr34501552wrb.83.1634067538223; 
 Tue, 12 Oct 2021 12:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <PS2PR02MB35412394ABF3E0441D72627E90B69@PS2PR02MB3541.apcprd02.prod.outlook.com>
 <CAPw1Ef-s-eXPs-8KmHLUyRav0JTWLHRDdLKsGFaKTWmkoeiQzg@mail.gmail.com>
 <CAPw1Ef8fKL_cE=absnX-QwMBVckKy5vkffC08ox5ogPt46aUSw@mail.gmail.com>
 <DM5PR11MB154720B60C84C20E395ACBB2E2B69@DM5PR11MB1547.namprd11.prod.outlook.com>
 <6fd6fe09-7fb9-43c7-591b-fee5ed94c20c@linux.vnet.ibm.com>
In-Reply-To: <6fd6fe09-7fb9-43c7-591b-fee5ed94c20c@linux.vnet.ibm.com>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 12 Oct 2021 12:38:47 -0700
Message-ID: <CAH2-KxCtrOn6+m=5400oW96Qtr0_5daVw2uFnn=XF-2BmOpCzA@mail.gmail.com>
Subject: Re: Etag support in openbmc
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 John Broadbent <jebr@google.com>,
 "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>, "Zhang,
 ShuoX" <shuox.zhang@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 12, 2021 at 10:31 AM Gunnar Mills <gmills@linux.vnet.ibm.com> wrote:
>
> > On Mon, Oct 11, 2021 at 8:37 PM John Broadbent <jebr@google.com
> > <mailto:jebr@google.com>> wrote:
> >
> >     I don't think bmcweb support etags. I have never seen logic from
> >     them and Ed made a comment about how bmcweb will have to support
> >     them in the future here
> >     https://github.com/openbmc/webui-vue/issues/43#issue-728321615
> >     <https://github.com/openbmc/webui-vue/issues/43#issue-728321615>
> >
>
> Yes, we don't currently support etag. As mentioned in
> https://lists.ozlabs.org/pipermail/openbmc/2021-September/027406.html
> if you plan to add, we will want to make sure we do this correctly.


+1.  Just some additional background, at one point in its history
bmcweb supported etag for the static resources (in fact, there's still
a disabled unit test for it in the repo), but it got removed at the
same time when it went from the built-in angularjs bmcweb UI, and
moved to phosphor-webui, because the etags were being generated from
the hashing procedure, which no longer happened in the bmcweb build,
so the data was harder to get.  In theory we can parse the filename,
look for the webpack-like value, and use that as the hash value for
the etag again, but in practice, it didn't really make things faster
in most UI cases, so I never really cared to add it back.

I realize you're likely talking about caching of Redfish resources,
which is a whole different (and much more complex) thing to implement.

>
> Thanks,
> Gunnar
>
