Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B95E343A6A
	for <lists+openbmc@lfdr.de>; Mon, 22 Mar 2021 08:17:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3m6D356tz301Y
	for <lists+openbmc@lfdr.de>; Mon, 22 Mar 2021 18:17:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=KoXirFip;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=manojkiran.eda@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KoXirFip; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3m603tltz2y0G
 for <openbmc@lists.ozlabs.org>; Mon, 22 Mar 2021 18:17:09 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 a22-20020a17090aa516b02900c1215e9b33so9963777pjq.5
 for <openbmc@lists.ozlabs.org>; Mon, 22 Mar 2021 00:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:message-id:subject:mime-version;
 bh=a60UWUZYVUu+LH1x6MD9++jcE8eHA8ZTlOU4ycy+Uk8=;
 b=KoXirFipe8WKscC7cIlU0btJLsVRAUr6BwpQyx3NwY371PsjHRvsKYM01v+96rFunS
 vcgRq0sVGjaFof2rBDSrJnh1zv7mewTWY6WzSUxrVKquaLChQemSsgnaBkkDa1XbsNCS
 qFOOdGFiGchqcjuhC9Ruq42XBTSniQPfS8z6MeJm5j+8jJeLLNzHbKY9jlHCun8Dk6yI
 5jiuz3pVupUo7vVTyf1LJzBcZR836TxqhICu9Prsdm8QyVxKmJ6kCMO3AmGU8/SIRJT8
 2uC9g0UL4BQQUL2QW9rf+unNBJES3t3yFwodkIwLbBJc/O3NYfabw4+WRUiHrEApZ/zE
 N8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:message-id:subject:mime-version;
 bh=a60UWUZYVUu+LH1x6MD9++jcE8eHA8ZTlOU4ycy+Uk8=;
 b=INxaiuFGMhuvkRgkE1DsX6LLiyBFSkajvuyaGg3WteDtqDtkz0kAd07HLFPq6jKvDL
 BNEHw/omPK73Eq28okQF8PR7Dg0RrRRae89CQcYWSzn5/QYWUYli/aSbBaTmOT/GOJbi
 iEs9jDn378tybsPp0RFNnYJCLQs6j+7MQ2DNkUjI6XAGP/1X/5fDilyhOnlNKSCM1KmN
 DQmWB0uGqnh6Pe81wP/mKCSVrPP8FNUF09g/B9Pu9qxmXsQKbs3w+om+SIbTLbCOphN+
 9mHUISy63Un5xBldA06fJC9dEn4NTxNO4mPgkcw9xkBWWcyfP4gyEt+3xvC58Rf95ZgM
 l6wg==
X-Gm-Message-State: AOAM532rcnPY3rjM/yRCmjK6j1KpeuvNW8Wx2Y/ZpGv8Fd9xnRTuUJFQ
 3fzFYEnKvyvLZR4bejVlMqPeXShF72iqRg==
X-Google-Smtp-Source: ABdhPJxRkeq3Af+dhm6wkvFptCbglpMMbt7OzsScYTbb4AQWPCfRqTPHdMwkBvRdyXUmjmUe0gyD1Q==
X-Received: by 2002:a17:90a:d41:: with SMTP id
 1mr12114599pju.232.1616397427179; 
 Mon, 22 Mar 2021 00:17:07 -0700 (PDT)
Received: from juliet ([183.82.155.202])
 by smtp.gmail.com with ESMTPSA id w37sm11300223pgl.13.2021.03.22.00.17.05
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Mar 2021 00:17:06 -0700 (PDT)
Date: Mon, 22 Mar 2021 12:47:03 +0530
From: manoj kiran <manojkiran.eda@gmail.com>
To: "=?utf-8?Q?openbmc=40lists.ozlabs.org?=" <openbmc@lists.ozlabs.org>
Message-ID: <6EE109AE-3FB9-4E5F-A6E3-88528EABFA56@getmailspring.com>
Subject: Spell checker in OpenBMC CI
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="6058446f_207eb3a9_1a57"
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

--6058446f_207eb3a9_1a57
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi All,

OpenBMC coders are all atrocious spellers. In my opinion, spell-checks are never given the highest priority as we always were more obsessed with code. Correcting spelling mistakes is not as easy as it sounds, it cannot be automated as many reasonable-sounding corrections could change the meaning of the comment.

I have been recently working on enabling the spell check on commits in OpenBMC CI so that the CI can score a -1 when it sees a potential incorrect/misspelled word(s) in the commit as per its knowledge acquired from the dictionary.
While checking the existing implementations in various opensource projects, I was impressed with the way the Linux project[1] addressed this issue, It seems to use a python library called codespell [2] for improving their upstream patches. It seemed pretty simple & doable even in OpenBMC.

As an initial work, tried to bring the same package in OpenBMC & my intent is to start with just checking the commit message first [3], and then improve the infrastructure to check the comments in the code as well. The only real concern is that we should have a dictionary that should be simple & easily editable.

My initial patch-set addresses this issue by having two dictionaries:
One generic dictionary that comes along with the code spell library [4], so that we can update this dictionary with the mistakes done at a global level.

Another OpenBMC specific dictionary[5] that sits in the openbmc-build-scripts repository, allows users of OpenBMC to add words into them. ( I copied the dictionary currently being used in the Linux project as an initial version)

Dictionary format :
Each line corresponds to a single word and they follow the "mistake-> correction" format.

I'd love community feedback on this . Please feel free to stop by [3] and give your suggestions/review comments.
Thanks,
Manoj

[1] https://github.com/torvalds/linux/blob/master/scripts/checkpatch.pl#L62
[2] https://github.com/codespell-project/codespell
[3] https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/41454
[4] https://github.com/codespell-project/codespell/blob/master/codespell_lib/data/dictionary.txt
[5] https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/41454/1/dictionary/openbmc-spelling.txt


--6058446f_207eb3a9_1a57
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Hi All,</div><div>&nbsp;</div><div>OpenBMC coders are all atrocious =
spellers. In my opinion, spell-checks are never given the highest priorit=
y as we always were more obsessed with code. Correcting spelling mistakes=
 is not as easy as it sounds, it cannot be automated as many reasonable-s=
ounding corrections could change the meaning of the comment. </div><br><d=
iv>I have been recently working on enabling the spell check on commits in=
 OpenBMC CI so that the CI can score a -1 when it sees a potential incorr=
ect/misspelled word(s) in the commit as per its knowledge acquired from t=
he dictionary. </div><br><div>While checking the existing implementations=
 in various opensource projects, I was impressed with the way the Linux p=
roject=5B1=5D addressed this issue, It seems to use a python library call=
ed <strong>codespell </strong>=5B2=5D for improving their upstream patche=
s. It seemed pretty simple &amp; doable even in OpenBMC.</div><div>&nbsp;=
</div><div>As an initial work, tried to bring the same package in OpenBMC=
 &amp; my intent is to start with just checking the commit message first =
=5B3=5D, and then improve the infrastructure to check the comments in the=
 code as well. The only real concern is that we should have a dictionary =
that should be simple &amp; easily editable.</div><div>&nbsp;</div><div>M=
y initial patch-set addresses this issue by having two dictionaries:</div=
><ol><li><div>One generic dictionary that comes along with the code spell=
 library =5B4=5D, so that we can update this dictionary with the mistakes=
 done at a global level.</div></li><li><div>Another OpenBMC specific dict=
ionary=5B5=5D that sits in the openbmc-build-scripts repository, allows u=
sers of OpenBMC to add words into them. ( I copied the dictionary current=
ly being used in the Linux project as an initial version)</div></li></ol>=
<div><strong>Dictionary format :</strong></div><ul><li><div>Each line cor=
responds to a single word and they follow the =22mistake-&gt; correction=22=
 format.</div></li></ul><br><div>I'd love community feedback on this . Pl=
ease feel free to stop by =5B3=5D and give your suggestions/review commen=
ts.</div><br><div>Thanks,</div><div>Manoj</div><br><div>=5B1=5D https://g=
ithub.com/torvalds/linux/blob/master/scripts/checkpatch.pl=23L62</div><di=
v>=5B2=5D https://github.com/codespell-project/codespell</div><div>=5B3=5D=
 https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/414=
54</div><div>=5B4=5D https://github.com/codespell-project/codespell/blob/=
master/codespell=5Flib/data/dictionary.txt</div><div>=5B5=5D https://gerr=
it.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/41454/1/dictiona=
ry/openbmc-spelling.txt</div><br>
--6058446f_207eb3a9_1a57--

