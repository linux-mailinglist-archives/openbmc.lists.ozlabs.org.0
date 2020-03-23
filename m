Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D89F618FEAB
	for <lists+openbmc@lfdr.de>; Mon, 23 Mar 2020 21:22:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mQmQ177YzDr5j
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 07:22:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::930;
 helo=mail-ua1-x930.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KHjNw7AH; dkim-atps=neutral
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mQlf1MzKzDr1R
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 07:22:03 +1100 (AEDT)
Received: by mail-ua1-x930.google.com with SMTP id a6so653407uao.2
 for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2020 13:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z2dsVg9ephWGJ29KY2ZlCWBdQNDsnoyAH61wgkY0RU4=;
 b=KHjNw7AHvt2y0gK8Ip4RIHlyPpn36HQR9JWpV5+JbZ7dDdOwmZi8m5bkrnewaN4Gn0
 e878nbJXwjwgEe3w8LC2BkEM9guZZT/8RvI6XNtbgElRNHii6/Yl8O9uLNwVADF5qy9/
 BkGr2kh8X509wUmsBN61MeO5ztu5h89VWYCnl6kf08dHLoYXwyjwjoxM8sXyQ2+h4C7q
 ph5/WuPY7COOs1IlyfdPzoEnblsGV511XK60yK4+KpiVdmBYArzFOQelITRQuo2TE7lf
 j3kGSv4hz1pGps4Yaqx6wVBtbF6Pwe4AkOq5YLuPGoov9d9aDYFplY1ntTbkVL9Mwfg3
 1hvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z2dsVg9ephWGJ29KY2ZlCWBdQNDsnoyAH61wgkY0RU4=;
 b=ZAO/rKs5guNrQKZlfarzOPLovs2Pk0gWU038D7yXoF/YhM1W+gc/F1MlvwF3KDImI0
 L11DVHKYWeqdeU+FdE2bmLUsZCZCGsDMgJLqUeZS6tHQ+Wql1C635PVS88XOC4st4WCZ
 6PEzaMgUSkpqNR22iHKZ9pJGAUdYgyOqo6na35MGAdVzWvYf85KmiRnBH1+X30l6qD+v
 1GiNm6mRVfDUfxRLF2vjNXIVwC9yLgx/QVKCFRl2MdZZwRMaiZxWp1A7GpCEQEYFTkoN
 V3xoRu08HG/5wkWznSxBnor4HpF3JzXj0WpuQS7RTWWT39b7zxZD0nGckee/q1RJyLbZ
 n+Ug==
X-Gm-Message-State: ANhLgQ0+kmS7aYjrSM8p8lAC9ZzynBb799DrwGdc4DT8pKKwyxvQRrIc
 J874QQtz8MotXmv2Qoh/6Ci+M50iMgQB6+2XJBU=
X-Google-Smtp-Source: ADFU+vubrtslVLoa0U8jKrmYwz6y1TveFOP3KvtX2GhQniyjP1K+bjm6OdOxZauPB1ZZbuYGbXcO4W2mxM8DRGGXU9c=
X-Received: by 2002:ab0:2150:: with SMTP id t16mr14864086ual.61.1584994920068; 
 Mon, 23 Mar 2020 13:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAG5OiwjaiBnGw17NZdW4=XDmiWpuEM=z5_jsTcJ8ws=p1umeRQ@mail.gmail.com>
 <1fdc7be1-71f7-4926-83aa-a531de6d5b81@www.fastmail.com>
 <477d3fbb-5aa8-d4e8-958c-62fb94e2acc7@gmail.com>
 <b9ef7897-f4a7-445d-a79b-289b399528ee@www.fastmail.com>
 <391eaabe-6ade-e23d-97ef-a0c1d6630f8c@gmail.com>
 <8d4e9e9c-2568-4ab0-960c-7383a981fbbe@www.fastmail.com>
 <CADy_Pt1tqqHjUaHER6T01kt_Wq6oqn6HtV=8Nn7KwK3CSMm7Ug@mail.gmail.com>
 <CDBD6ED0-751F-4EBC-B304-243FF105905A@fuzziesquirrel.com>
In-Reply-To: <CDBD6ED0-751F-4EBC-B304-243FF105905A@fuzziesquirrel.com>
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Mon, 23 Mar 2020 15:21:48 -0500
Message-ID: <CAG5Oiwi7bgFCuT0OdmnmVrou1cyW-aiv+RK6TmtGe6HPQw=eHw@mail.gmail.com>
Subject: Re: OpenBMC Project metrics
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Brad. I talked to the LF about Chaoss last summer and it was
still in the works. Looks like they have had a release, and that I
should look into it again.

It is great to see Yocto bring it all brought together into a clear
dashboard. I've added it to the community infrastructure list [1].

Kurt Taylor (krtaylor)

[1] https://docs.google.com/document/d/1QCFRGCRofcR3K8clSLtJHw10-Cu9zkp0dvwXPWzQSCc/edit?usp=sharing

On Mon, Mar 23, 2020 at 7:44 AM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> FYI - The Yocto project put up a project metrics page:
> https://lists.yoctoproject.org/g/yocto/message/48893
>
> The stated goal is possibly this:
> > we have put in place a dashboard that shows our community engagement and
> > stats
>
> -brad
