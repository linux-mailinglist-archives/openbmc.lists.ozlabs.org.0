Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E08DCE88
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 20:46:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vw3q3wdnzDqMn
	for <lists+openbmc@lfdr.de>; Sat, 19 Oct 2019 05:46:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="o9R4OI8w"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vw3136LzzDqHv
 for <openbmc@lists.ozlabs.org>; Sat, 19 Oct 2019 05:45:48 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id q7so4401328pfh.8
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 11:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DTTgBZz5dhpSoKRXuvHFRuoS5ZSyIi8MWOh5SwjuA5Q=;
 b=o9R4OI8wNZagKBvowyrlwe6lkxSURSsLys1tyWzT18xci9JSXHz/pDWT3kHyxo9o82
 oF1B/0F2yeG1ZNK/uPRJ/K6LwAjbvQzR7Acqpe3RuqDG7dbA7wq6pYpCPhUoQ3hFAqGe
 o4VObu+EJYseHEglZSuYL02VZbTc0iMYMK7Qc89qxxr3wqo9EIyiedCHXE3da3CWaVY1
 kKailPHJHPGogZKuufqFGtQkN1cPgmUKzkg6hLhPNLYCGp9qodQueL0p6X3QS6a9zxzx
 9yYPCDOS/3nQyQLTq+5zQf+aiWrn0WQjTEQDbQ0/6FQZ/SJHrh+y7HUSyWA+tq12phGs
 YPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DTTgBZz5dhpSoKRXuvHFRuoS5ZSyIi8MWOh5SwjuA5Q=;
 b=gfWYfHIn0ioljEO9l+uio1AEyd+DJNstHppNQGYCNrLARd+IsvMwBMghEgfXwFEYr1
 HJ5CS1HVeZCnGNTrbF1T9nT8/weGpoT1QB3jY0ltl0TjpzCXaNjRDd14q+fQahs9Gos2
 /EN6DO5d0EUViGD3KR2R2aI+AyCNGrSXuzObhOJ7AC52LuwY9MZfKfG6FroP420Zt/HF
 +qeIkmlBcIekQ91F6ImxoSglEBCyx6+wz5CVyrVtG74fYJ4W/3wH6YT4rNLOCfeuuzPK
 fHORQ3tVpst+WhnJCq3myTrmQXi+QKFYPaKHcchh/zaD6PU7XHLRsr4JsVXo7+tcsbEc
 FgyQ==
X-Gm-Message-State: APjAAAXeqPdws0ykWdIl8M8El8/xQGZi7Oya4IEzTL+wI0Nmndee8mEv
 MbjBDhOuZJKsI04BiBP6f6sVBKFtxOcJsgIMJz5Bwg==
X-Google-Smtp-Source: APXvYqyv4V17SDLKXgqq7wYmGak2EcPh6h4eHSc2GGypbSKc8WF+78D46uT6NyYllp7TMExxlyUiCAj50PP7LeKTNZE=
X-Received: by 2002:a63:1c24:: with SMTP id c36mr11481351pgc.292.1571424345412; 
 Fri, 18 Oct 2019 11:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <b09011f57074c8a9dc773937c0921f9860b92e50.camel@fuzziesquirrel.com>
In-Reply-To: <b09011f57074c8a9dc773937c0921f9860b92e50.camel@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 18 Oct 2019 11:45:34 -0700
Message-ID: <CAO=notxwxEMHFUjd1oMocJ_PK87roxFpVDSyH0HtdwPM7HQiNQ@mail.gmail.com>
Subject: Re: first boot repository
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Geissler <geissonator@yahoo.com>, a.filippov@yadro.com,
 "<wak@google.com>" <asmitk01@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 18, 2019 at 11:30 AM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
> We've collected a number of "do x on first boot" type scripts and
> systemd units.  I'd like to create a repository "phosphor-first-boot"
> to host these.  Does anyone see a problem with that?

+1
>
> here are a couple:
>
> https://gerrit.openbmc-project.xyz/c/openbmc/meta-openpower/+/26292
>
> and there are others for things like creating users after a code
> update.
>
> thx - brad
