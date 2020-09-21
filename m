Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 968692730F6
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 19:43:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwBcb2WRwzDqMt
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 03:43:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=xKcmiuc/; dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwBWK3QFXzDqHF
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 03:38:52 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id k18so2118910ybh.1
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 10:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ix2+DqvNPnuOnd1O4m6KEtwPWWJyJhNIpN8Wr4iXlkA=;
 b=xKcmiuc/zsrCRRiSjSAYXwdqyyMBc8jOZ5Ls/Y+ECf6uVRKdIg2w4IsASDiKLjEn9J
 s4ZvhUAD/rU9UPEQEIwcO08+qzOci4RAWbP4nfvWa8KVtkMh0tpR2DVzaxc2BNG8mD1x
 y47MEtEezraA1XJPExXxMCUK42Y7JA7hspGh5NWV3TaN0NT8NXvBqwT/r5vMUxCL8lxc
 OX3MfVucl3a0mnfTTjppL7LPm91maqwAvS0mDGaMwqYSazYWb8OSKQbmcu7+hgMizP4U
 KYR2Tjl1CcrZ9AK0Mx7cNOtJYWwMidWcKsfIhdnWRWxUXm4ckJBayUai4W2IxDVHXy6Y
 aKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ix2+DqvNPnuOnd1O4m6KEtwPWWJyJhNIpN8Wr4iXlkA=;
 b=ujOR59l6ECcfNcbt4tmtgATbK/DyUSidxXWNJXDENlHseh8eXjGNoDtEy4LQB4bt15
 odGGExDk85eNFdfRSgKaso+7Zzx29ker596+h56l9oAPwRkfBYlAN9kCUURYq0OA6TJN
 XNvg3OQ7fjUqOv26sJkmUb+ftE10lFLDmP3VTux8GKr5EQEP9jlU8oGjxS+aEM3ntt31
 LcGneIGICWwWzik6WMf66qFWSZnp1d/hAVS+V+q7ThMdqsoJU/oLn+A1ZkwnZVfTwxHs
 lu+SXtQ7niIBeR2lITaaR+GmRTNRhgg4vimTIvFx7lVU3Vz18T052VB+YQHLQng+qrz5
 8PaQ==
X-Gm-Message-State: AOAM531CTjrJFCqgOHPgfeh/uY7OzvrUZMNxYgIPH8pA8jHJ/yjs8QQ/
 kfdNLO234M8FUvjYd+Orb5KijWB84+OXcbma7bNj5Q==
X-Google-Smtp-Source: ABdhPJylhyg7Jryg9TpNRmqZFdpjCgBYXVCujxEZwj0kPian2efkBzqgCg4wCUojZ6O4SQdnfjADTkMWbVZdSIol5IM=
X-Received: by 2002:a25:aaf4:: with SMTP id t107mr1183811ybi.209.1600709928072; 
 Mon, 21 Sep 2020 10:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <CACWQX83ayt4eBcfH9wi87hz4-YMGqTC1=c=WdOzLcv_0wQ6mDg@mail.gmail.com>
 <OF91B43372.8E81A7D9-ON002585EA.0056113C-002585EA.0060099C@notes.na.collabserv.com>
In-Reply-To: <OF91B43372.8E81A7D9-ON002585EA.0056113C-002585EA.0060099C@notes.na.collabserv.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 21 Sep 2020 10:38:37 -0700
Message-ID: <CACWQX83Qcxh_QVeWQyxB1_FW45D5U9zZS1hNYOAyxPrj0EJTpw@mail.gmail.com>
Subject: Re: Proposal to make webui-vue the standard
To: Derick Montague <Derick.Montague@ibm.com>
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
 Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Sep 21, 2020 at 10:29 AM Derick Montague
<Derick.Montague@ibm.com> wrote:
>
> >> resulting in a decrease of development activity on phosphor-webui over the past six months.
>
>  > Ironically, you sent this out on the same day Vue 3.0 was announced;
>  > It looks like the next 2.X Vue release goes to 18 month support.
>  > Hopefully Vue 2.0->3.0 porting isn't the same thing as Angular 1.X ->
>  > 2.X.
>
> It will not require a complete rewrite. Google abandoned AngularJS and Angluar was a complete rewrite,
> which is one reason they renamed the framework from Angular to AngularJS. We can start planning for it
> now, but many of the supporting libraries are still in beta with a plan of being released by the end of
> 2020.

That's good to hear that's the case.  I'm in no way saying we should
go to Vue 3.0 today, just chuckling at the state of the Javascript
frameworks as a whole.

>
> >> Loading webui-vue from the BMC causes content-security-policy errors (#32)
>
>  > This is important, and having the UI load without errors or warnings
>  > speaks to the quality of the UI as a whole, and also allows finding
>  > regressions much easier.  Looking forward to when this lands.
>
> Agreed. I am researching this now.

Sweet.

>
> >> The last 2 identified issues, we are looking for community help but might take these up ourselves one day:
> >>
> >> Mutual TLS (#30)
>
>  > This is used, and I think important overall for the security posture
>  > of OpenBMC.  I would like to avoid regressing the default security of
>  > OpenBMC in this regard.
>
> Agreed, we will be adding the IsAuthenticated cookie check.
>
> >> CSRF allow list (#29)
>
>  > Do you think the person that checked in the code around the security
>  > bug could take a look at it?  It looks like Derick wrote the commit
>  > that needs fixed.
>  > https://github.com/openbmc/webui-vue/commit/e080a1a7593e83a49d623ffdd452fd0e1c617889#diff-d33bbe646af7d8d45caaeb27b20b4813
>
> Yes, we are looking into this. I am still not quite clear what the CSRF "allowlist"
> is can you point me in the right direction in phosphor-webui?
>
>
>
>

phosphor-webui just used the stock angularjs XSRF handling.  I'm
really surprised there isn't a similar module for Vue.

The short version is, you can't expose the CSRF key to any server that
isn't the BMC.  That would be a leak of private information, and while
not fatal (as you're still protected by the session key) could be
chained to implement a CSRF attack.

The important lines of code that you need to implement are:
https://github.com/angular/angular.js/blob/6706353a71e3c11c56c0b19be03600dac57aafe1/src/ng/http.js#L429
and
https://github.com/angular/angular.js/blob/6706353a71e3c11c56c0b19be03600dac57aafe1/src/ng/http.js#L1410
and
https://github.com/angular/angular.js/blob/b4e409bf6cd81307f57e51f2f1281b05ceb6cbf2/src/ng/urlUtils.js#L136

It should be noted, because we don't expect the bmc to be doing any
cross site scripting, you can simply implement the check against the
current origin, and don't need to maintain a list anywhere like
Angular does.
