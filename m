Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5CB102879
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2019 16:46:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HVYr0n2bzDqdx
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 02:46:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YHL1XtAG"; 
 dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HVXQ0RKgzDqdh
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 02:45:39 +1100 (AEDT)
Received: by mail-ot1-x333.google.com with SMTP id 1so1410792otk.1
 for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2019 07:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=S/MHD4Jn93qKCH7leWBUMMBTSRyww3nX0le4Kd4ToHE=;
 b=YHL1XtAGJUFhJRm67a38V6hsaYODLwLzCaJ/b2knbU7pUC+hjDBYoS98W48u0SeN70
 RatfmIiJLdJnkomyO+9p5oanCEUvoACh7wI44mtCFiX2gKszW4KUv9Z8Cc4L+mlBVLjf
 4Dwpkiiaf6gpXj8R53yuATEYeupFumqGgP9e5nl0AC+tyXVP5byiGtzGEH0+7Pp/cBIy
 0/21WDF3py0hFwFNnKjT4Ey7ukeylj001TvVt6Kc0LH3PQfE/g7l1btJ36Y4YspXwzas
 Fx7LXECMWN0sYaab7O/MBeewY4SVtfCZpNLard4P25zwhR3tknNqBVI05hoGDlN+01FF
 EIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=S/MHD4Jn93qKCH7leWBUMMBTSRyww3nX0le4Kd4ToHE=;
 b=baG9hd5IYag5HlWyOakcUnTNSBHx3/pnLWG31WwrPkD7veCPM8QKO+SHpKup+JV0Q7
 3ZL91LKIHfI00QJlCIY4UUKSZDP6AXQoqguT7+rQ00yHCLIRcgyX7Ty021YTbOv+2yPJ
 nZCts/W/O4gA79QbkKMXpij/ttJsK2zRfISRiPqk+IHHXAv89llKZT+PuVbr2FLhx/qX
 eIsSYJzzKfAGzVrsgprNLtUQT1mL/Qs+imsboqYUh9CTtoHRaROJSAojpqX0BJtOQmQq
 E2RlWXsQ/wDfGQFekopDR8YdBmq7B5vKyjZUb3xH609Y4uAXKLkypIXkehOdFFcKpcRo
 XKtA==
X-Gm-Message-State: APjAAAU2eAZ+WB2DCk7sgoSKubvbIbGK+Af2641hB4oI4zd47bQmmn5c
 2gvUCmA5q33+PYHujmMo3Cw=
X-Google-Smtp-Source: APXvYqzevzwEsvexXuLyGhN77N+Rp90JafPpaTCrTtNqYQwha+aPpLCtLSNcDHx79YlsZXbmNVuEUg==
X-Received: by 2002:a05:6830:50:: with SMTP id
 d16mr4091379otp.132.1574178336299; 
 Tue, 19 Nov 2019 07:45:36 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:c810:fa2c:7dc8:2e7f])
 by smtp.gmail.com with ESMTPSA id v193sm7324260oia.8.2019.11.19.07.45.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Nov 2019 07:45:35 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: 2 patch dependency
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <20191119003509.GA80304@patrickw3-mbp.dhcp.thefacebook.com>
Date: Tue, 19 Nov 2019 09:45:34 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <2231F8C7-719B-468B-BABB-92AF197F92C8@gmail.com>
References: <EACBC95B-0761-4667-A622-E1C0EA6EF1ED@fb.com>
 <E782C583-DBB7-4589-BFE6-EC69E2343424@fuzziesquirrel.com>
 <20191119003509.GA80304@patrickw3-mbp.dhcp.thefacebook.com>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3601.0.10)
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Nov 18, 2019, at 6:35 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> On Tue, Nov 05, 2019 at 09:27:21AM -0500, Brad Bishop wrote:
>>=20
>>=20
>>> On Nov 1, 2019, at 3:18 PM, Vijay Khemka <vijaykhemka@fb.com> wrote:
>>>=20
>>> We have issue of merging 2 commit which are dependent to each other. =
I am not sure how are we going address this.=20
>>=20
>> I=E2=80=99m working on this today:
>>=20
>> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/26910
>=20
> Do we have any sort of topic-based multi-repo testing?  If not, is =
there
> any interest in developing it?

I know in general we really try to encourage people to not cause
co-req issues across repositories. Making this easier for people
may cause more of it to happen.

Also, I believe we=E2=80=99re going back to just having everything in
openbmc/openbmc so that should alleviate a lot of our meta-*
co-req issues since they can all go in together again. Brad was
working on getting the gerrit plugin running that allows people
to maintain sub-directories in a repository. This will allow multiple
maintainers of openbmc/openbmc for their specific areas.

So to answer your question, I=E2=80=99m not sure. I think it could still
be useful to have between code repos and openbmc/openbmc
at times but I=E2=80=99d rather people just do the extra work to avoid
dependencies all together.

>=20
> I implemented this on another project:
>   * Whenever Jenkins was triggered by Gerrit, it looked at the
>     GERRIT_TOPIC variable to determine if the change belonged to a
>     topic.
>   * If the commit was in a topic, Jenkins queried Gerrit for all open
>     changes that belonged to the same topic.  Using `repo`, Jenkins
>     would extract all of these changes into a working directory and
>     `bitbake` to kick off a build.
>=20
> This was useful both commits that spanned metas and for commits that
> involved both code and recipe changes.  This was really useful for
> changes that added a new dependency so you didn't have to add a
> free-standing recipe update with a "trust me, the code is coming that =
is
> going to need this dependency" kind of comment.
>=20
> I know we're not using `repo` right now and so there is some work
> involved in making this span the OpenBMC code repositories, but a =
simple
> first step would be to get this working across the meta subtrees.  =
Would
> this help changes like Vijay's so we don't need to involve a =
cross-meta
> maintainer?
>=20
> --=20
> Patrick Williams

