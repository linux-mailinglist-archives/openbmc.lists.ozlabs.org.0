Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5DA48E078
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 23:41:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZfY74Vzgz2ybK
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 09:41:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=MnMa0EQ8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=MnMa0EQ8; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZfXp0X59z2yLM
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jan 2022 09:40:56 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id fo11so8409243qvb.4
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jan 2022 14:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k4SvIwUzf9cdTOBsNHxCKeaUsmK+b1UItTM+ztdYuS8=;
 b=MnMa0EQ8Cxu/UHIo9dFcji2miGgcuixKkoX17Yqlt5xfJ1vS4nSOGj01Bh7HIMd3pH
 tOUXhgQz6TqgeBjLNEr7XdC+lQNE5OT4PsfTkeMEnfRNOuCjCnlyqCdS8KDByOFqrMew
 dn395DGdntFidOIwOMkGEHH2BoCyx9wKJuyBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k4SvIwUzf9cdTOBsNHxCKeaUsmK+b1UItTM+ztdYuS8=;
 b=x13SsxSBpCPnKi28Ixsshc5Y0XS8ooIWSI6epSt+Je6WD8oyVoZtphzYSyBGam7Jcc
 S5Ir4o34f7rTEHWgEtbV9oz1hWR6cihleaK9VBV+XjKM4EbVtchPvMJK2qIPaeD4QJJ8
 3R9R4Huz3qDBWJOg7JJjhZbrgR2n7YI4egvkSck4Isd0eZvSIZ1no2uauezxcEdfQQ1B
 Ze3jnnvyMlCxi/68eZmhUR7mOAFfLMBbfOorXA//RO+5QDCCyOx515sBBgJuM54j1TDi
 dn+ffwtRHzSeV0mv7P6rZujMGdFTayajzN2a8kx2Cf0l/unmBhj3I/pqHu62n/tegWyN
 Hnqg==
X-Gm-Message-State: AOAM533lF+sutVDlRXnInMbWJ9wVl/7uId6lWwU7Tp7zeLtrwf6UgLni
 Iu84jWHyV2c3yIFZP84TSmUJ8RuB2wjsqTZR2kgBayVn924=
X-Google-Smtp-Source: ABdhPJzwevM743AQdP/hoQ6uJyL0VA92un0VG3JMx7wOLqnK74c876sKbyqzz3v6pEeGII5AtrT9dOH44vrJ4F7GQjY=
X-Received: by 2002:a05:6214:2522:: with SMTP id
 gg2mr6023914qvb.65.1642113652756; 
 Thu, 13 Jan 2022 14:40:52 -0800 (PST)
MIME-Version: 1.0
References: <CAGpPFEFoTO-cUxvxEnoNQ3YoKBWRK+pOeyGzni6E5Da-=w+stA@mail.gmail.com>
In-Reply-To: <CAGpPFEFoTO-cUxvxEnoNQ3YoKBWRK+pOeyGzni6E5Da-=w+stA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Jan 2022 22:40:40 +0000
Message-ID: <CACPK8Xec1P8xF9t8Uj1Fg0YsX4v6Y6Gi=KkeZD70AoLPqZB=PA@mail.gmail.com>
Subject: Re: Procedure for the send review on u-boot patch
To: logananth hcl <logananth13.hcl@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, 13 Jan 2022 at 08:52, logananth hcl <logananth13.hcl@gmail.com> wrote:
>
> Hai All,
>
> In openbmc/u-boot repo(branch - v2016.07-aspeed-openbmc)
> https://github.com/openbmc/u-boot/tree/v2016.07-aspeed-openbmc
>
> I want to send a review on this particular branch in u-boot through upstream.
> Is there any specific procedure to upstream it,
> kindly provide your suggestions.

I strongly recommend using the newer v2019.04 based branch for any new
system you're bringing up.

However, if you insist on the older branch, you can send patches to
the list for it. Indicate in the subject that they are for the old
branch:

git format-patch --subject-prefix "PATCH u-boot v2017.07-aspeed-openbmc"

Cheers,

Joel

>
>
> Thanks,
> Logananth.s
