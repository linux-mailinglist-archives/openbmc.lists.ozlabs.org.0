Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C73B0E3D17
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 22:21:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zdtW3LlbzDqfX
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 07:21:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EJYCwdj4"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zdJt6Zp2zDqc8
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 06:55:42 +1100 (AEDT)
Received: by mail-ot1-x334.google.com with SMTP id m19so108679otp.1
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 12:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7o64QRuOCMSeAIcwhzp/5M7DvijveWoHyGIK8wKu6p8=;
 b=EJYCwdj4JUc304V/nLN2WtId2yYQeM5d4lAlEt6wObTn34x2xNFwO12uo+8pHdfRpZ
 kCcg9lKqdPlLeNgsC4yC4sLk/IOV1cFq05YcvBpWx6zN+ywtgGpOQ6B6+nvTdN9CmqPW
 MwJ1M5tcTPzNv4JPhs1khFTkJTJoyUB4Fwl2cVxcqDtpZiAco11wySIr4QH/7ZKezT5W
 eRUYi22TWXN0nFpR8jf4k8drdfjaUujU+f9DeliA3yxyZ/RB3E1C8pLpx7kS/yLnnKZs
 lnkNgqKejq/i/MlgHE4wS4nOkR+F9xnFnWpVHDxMOXEG6uLTsU9lBec9CAA/YKvxbHTc
 8zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7o64QRuOCMSeAIcwhzp/5M7DvijveWoHyGIK8wKu6p8=;
 b=VYrRTdmuyQyvbruZXhE7RxVAOVicnmaGJ7JvCIgD2xrJBo5La+qx6c9vey6XosHHWD
 AFij+dnH9r1ekwoy50hEYr9gc+9NnXQxd2DyCpFXIVglYRD5VDE3yeD5drlDJK8PFLj8
 NwFqYYHeqb2NgMeqdgIGYX5Ga+Xi/nU34rmWs3Brodj8ifM7UkNubkargsEDGkLZVWSA
 M2ZEoYtLciped1BVuilTM3gi85+ZLY7YaBiqN80ADQ6+Md1G+YmVreUMW/jNneAhyi4g
 oTBZNavIsxGRTomm0CTUJWPeqeP9Y1zm0egnTxsNvAWlNptZdty2gsB9adPogpUI2hiI
 UFQg==
X-Gm-Message-State: APjAAAUJb58qASG67R7EDBc8su09F4zUaGQC5SIQf8VPaZ1BWioDGsYQ
 oqqrzUqg9n/7OrfnB3EWD/A=
X-Google-Smtp-Source: APXvYqxs5/PWN9iYV7fQNUKzyHiBh6E6zZN3+L/mDcO+Aw1MaiGWsw+TXSO1aq3P7jTge1A+sayrBA==
X-Received: by 2002:a9d:7345:: with SMTP id l5mr7231745otk.39.1571946937248;
 Thu, 24 Oct 2019 12:55:37 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:5d8f:8fae:d6bf:f512])
 by smtp.gmail.com with ESMTPSA id e16sm2823341oie.38.2019.10.24.12.55.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Oct 2019 12:55:36 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Continuous Integration Build Failures
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <907DC60D-00EE-403D-82D0-4EFADD245A9D@fuzziesquirrel.com>
Date: Thu, 24 Oct 2019 14:55:34 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <31A30B99-1B20-4098-8137-7027147E0DE3@gmail.com>
References: <1b633df0-8ce7-963c-cb6b-d79ee7d24a9c@intel.com>
 <907DC60D-00EE-403D-82D0-4EFADD245A9D@fuzziesquirrel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
X-Mailer: Apple Mail (2.3445.104.11)
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
 Johnathan Mantey <johnathanx.mantey@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Oct 24, 2019, at 10:40 AM, Brad Bishop =
<bradleyb@fuzziesquirrel.com> wrote:
>=20
>=20
>=20
>> On Oct 24, 2019, at 11:16 AM, Johnathan Mantey =
<johnathanx.mantey@intel.com> wrote:
>>=20
>> I would like to propose a change to how the continuous integration =
system works.
>>=20
>> I understand there are many builds, and there is a lot of data =
associated with the builds. Thus the current desire to remove the log =
file data in a short amount of time is a requirement. This works alright =
when the build succeeds. It's unhelpful when the build fails. =
Identifying where the build fails is impossible after approximately an =
hour. As an ordinary contributor I don't know how to make the CI system =
rebuild the source code so that the log files are available again =
without pushing some new change that consists of a useless piece of =
whitespace (or some other pointless change).  It shouldn't be necessary =
for the contributor to make requests for a build restart to the CI =
maintainers, they have their own agenda.=20
>=20
> Are you referring to the bitbake CI jobs or the repository CI jobs?
>=20
>>=20
>> Are the maintainers of the CI system willing to make a change that =
aids in debug?
>>=20
>> Suggestions:
>> 	=E2=80=A2 Don't delete the log on build fails.

Other then some old unsupported jenkins plugins, I=E2=80=99m not seeing =
any obvious way
to this one.

>> 	=E2=80=A2 Delete everything but the log ascii output on build =
fails.

The CI jobs really don=E2=80=99t have much, there are no artifacts =
associated with them.
Lets try delaying the build deletes for 5 days and see if anything =
horrible
happens. I just changed this in the job.

>> 	=E2=80=A2 Email the ascii logfile for build fails

I don=E2=80=99t believe we have email support on our Jenkins instance =
currently but if we did,
this could be possible. The email address is known via the gerrit plugin =
env
variables. There seem to be some jenkins plugins for sending emails with
data on failures.

>> 	=E2=80=A2 Email a compressed debug bundle to the submitter?

See above

>> 	=E2=80=A2 Allow build fails to be restarted by the submitter so =
the logs can be regenerated, inspected, and captured.

Sounds like if you are logged into jenkins you can resubmit the job, but =
that=E2=80=99s
probably not all that useful because you could just look at the fail. =
What a
user really wants is to be able to retrigger the CI build from within =
gerrit.
Maintainers can just add a +1 to Ok-To-Test to cause this but
non-maintainers can not. The current =E2=80=9COk-To-Test=E2=80=9D design =
is in place in
gerrit to ensure only trusted people are running code on our CI
infrastructure. We can=E2=80=99t just let anyone with a github id =
approve the
CI runs. If there was a way to tie that ability to the user being in one
of the gerrit CI groups then that would be great. I don=E2=80=99t have =
much
experience in that area though.

>> 	=E2=80=A2 other=E2=80=A6?
>=20
> At first glance these are all good ideas.  Andrew how many of these =
can Jonathan implement himself and how many of them require access to =
the Jenkins instance?

Unfortunately I think all require access to the jenkins instance and for =
some
access to the actual VM (email support).=20

