Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ABA614159
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 00:09:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1TP75Jr8z3bm6
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 10:09:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ml+CyZx+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ml+CyZx+;
	dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1TNW6Ymfz2xbK
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 10:08:43 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id cl5so6369344wrb.9
        for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2022 16:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ihc54qwdHeOFUfOzB5x3UYILJrwiyPiWIeXV8PT5Qw=;
        b=ml+CyZx+I5QVYz+8vUQ0ITIEEFJMFZYTQ3sHa8V5ZfFsnlHJEDRtccqo0ARorclkMs
         f8Hit/EICuZbDw52Pz0mb7EfECT4tyr6FE+R5xBnfrtOCVnLcU7y4aNiwIqzR+rSfiW4
         3kuLEPkvXMSuPq2XahZMid5jJXGVZ04QmuZfaHYpJ1qXo8Bj/PDpzctFOLlvtXzdVa7C
         qtYQ2HzYuP3rGMzYe691UN7hTgY7ZUlTuLkU+ujwJda4bmnLcy8kLCM7WrCc1nw20CI3
         k6viwrAtVu6Vw+dm2TmDK9sGVKwF93egcdk7QGjc33+WibTIkE7lIscrxYVYq78WAAar
         MAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Ihc54qwdHeOFUfOzB5x3UYILJrwiyPiWIeXV8PT5Qw=;
        b=nDFN7EiddEVoDO1NB01algyUqkm+ELwuuVE3iqNX8bEa7bVYOCdHyHWvT4LLL0qYyr
         2T8K0UuDgrxodXo/ZrjO1A+30f6N2szvztHs/vncSF5jzdWUuctkLjKgzXtv/Oqv7HH1
         /uXVWdFB4LbwH2XCWcz1koY+XpHULV7+vgHWX1Kr0c9AhtEnu/sTPwTtRmbrp3AImdFQ
         FNqKZ3JwlR3pnFYCzEmblx67LQR0U7XwbYAXUwLnNy2ftTll/TZBYqW5F+Ycv1xlzGKZ
         Nqxbs8lM/FrpcrzgOb8cI5bS51CqckFrf5FR5rqqef4VqHNMlFHNhMKUaA96pPvKlFJ/
         GpCw==
X-Gm-Message-State: ACrzQf2rihQkhFYn96hsMXwVgGmWA+VW2Wq/nvVVXc5/mpm4jzsd9v+3
	BKX8lgxULf4S9vXb1yHXr3PpXLvUbxmf3eG43iJ5O3uabtzQ3A==
X-Google-Smtp-Source: AMsMyM7sVWOyhBgJjmhk8GGu+32c5IJYNIFm0Jx7tgr+bE5ASyyzvDuP2h2GeELU1HpNAlL3+9ZWQByNRdLFUHagYQY=
X-Received: by 2002:a05:6000:819:b0:236:8e16:e187 with SMTP id
 bt25-20020a056000081900b002368e16e187mr9746171wrb.157.1667257716151; Mon, 31
 Oct 2022 16:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221031230552.5ssc33v2xnghooqy@cheese>
In-Reply-To: <20221031230552.5ssc33v2xnghooqy@cheese>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 31 Oct 2022 16:08:24 -0700
Message-ID: <CAH2-KxBitrjid+DGxgwMsOOXAwOTfehc1P4wjpzOyyorr+DWrQ@mail.gmail.com>
Subject: Re: project wide changes to maintainer ACLs
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 31, 2022 at 4:06 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>
> OpenBMC maintainers
>
> This coming Sunday, November 6th, absent any feedback here I am planning
> on:
>
> 1 - Removing admin repository access by <xyz>-maintainers groups from
> all projects on Github that use the OpenBMC Gerrit instance for peer
> review (no change for projects that do not use the Gerrit instance like
> the kernel, u-boot, or qemu).
> 2 - Copying the submit prolog rules from the openbmc/openbmc Gerrit
> project to the openbmc-all-repos Gerrit project.
>
> Impacts to maintainers are:
>
> 1 - Members of <xyz-maintainers> groups will no longer have any special
> access to the GitHub repository (such as push, force-push).  If anyone
> requires such access, please respond to this email.
>
> 2 - You may now delegate the Gerrit OWNER role via the OWNERS file in
> your project, as supported by the OWNERS plugin documented here:
> https://gerrit.googlesource.com/plugins/owners/+/refs/heads/master/config.md
>
> If there are any questions or concerns with the above, please reply.

Sounds good to me.

>
> thanks,
> Brad
