Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 098F2ABE67
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 19:14:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Q40d24MDzDrDp
	for <lists+openbmc@lfdr.de>; Sat,  7 Sep 2019 03:14:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KwkbtTcZ"; 
 dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Q3zy0JdPzDqsw
 for <openbmc@lists.ozlabs.org>; Sat,  7 Sep 2019 03:13:33 +1000 (AEST)
Received: by mail-io1-xd31.google.com with SMTP id j4so14340440iog.11
 for <openbmc@lists.ozlabs.org>; Fri, 06 Sep 2019 10:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Iq6d60+uMDk9uYHpTQ0ywb0J7qg0YceXmb6kI5yf/No=;
 b=KwkbtTcZ78Pwge/d50GQWS4vgxmlY80t9Cu6LO7W8v8nNNYdbhPeu1Jrb8As0ra5ff
 h8FJi08+DpfUA/v8j3VC6kFLoIRUN8vRegOwTyoiVO2Ud27aI9tD2YlPN+w0BhECSGjT
 lWtgrONghbfuty/wBMDb5fGBdYi+I5feNyHvQvbn8RBdOnEhwavQTw17VpfXnQ81bxr1
 issrQvLOUE+wqEmx3VdHEwDtJIhgW8gOYE/sXimpFqpuVHDPsvJHt8PlsvPrIDeFRQkp
 CkzIb9MqgxfXOfEW0GyNJ8vb/bZ181ZnQrSf2M32wzKs0jRBGcTMitx8wMVv+1jWpBYH
 xl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Iq6d60+uMDk9uYHpTQ0ywb0J7qg0YceXmb6kI5yf/No=;
 b=QXxhpYDxmEY+cKTEPQZKmcwOvSz4/wUP/StPUKgSLAf5jgovkBl2yN7Tkcu1t0AtHe
 W7hsbYkMo9bJU5ycs+zWoKhUZG9mNtoQxmJC5ssuyUVBNaAwg0IKE11Ga/umOktpL+lB
 e1aQw7GZItNiYyaKj+/6+0jugOF+6CvBUuzwskFpnECbH2JcsyxNDkNiy3WfdyWKJYOJ
 6KFmeW7Nrwifqi1sX4cJKK10dgkLGm2JBJx0bnUEIzXZgDJPO39xrpY1f4N9OavcbWDf
 T0viRALHhDx2Lefv1cyP1xXTalHAwhi6/fpWQHma4sq0/NUt/QrScBTuH6uShT2zNhaw
 EioA==
X-Gm-Message-State: APjAAAWo6JCfHCIxH0QUHJSWz1YQ+Jcvqr0BtTMB2r2GVJyXKyZo47Px
 M/vUfkWRFG2fX7bDmmmHBnpJV8MwOMiPGKj/FW7qMJxPjnA=
X-Google-Smtp-Source: APXvYqznJjjuKgV8FHjPL31m/Qhykj7+yPPMLFEZ9LOUWDc1xZM1sLhS+bMLMwdNY+FpI4wVmV6gn2ibMwM1vqWTK8U=
X-Received: by 2002:a05:6638:627:: with SMTP id
 h7mr11340872jar.33.1567790009669; 
 Fri, 06 Sep 2019 10:13:29 -0700 (PDT)
MIME-Version: 1.0
From: Lei YU <mine260309@gmail.com>
Date: Fri, 6 Sep 2019 10:13:19 -0700
Message-ID: <CAARXrtk20BTpqFac1LiR8f6eHE_g+=rQwd__kU5qkbEsAMSktg@mail.gmail.com>
Subject: A RFC patch related to meson test
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This email is to ask for comments about a patch to meson test, which is kind of
a hack done in the OpenBMC hackathon.

Background:
1. If we are using OpenBMC x86-64 SDK about a month ago to build and test a
repo with meson, the unit test is not really run but skipped.
The sample output looks like:

ninja: no work to do.
1/2 util                                    SKIP     0.00 s
2/2 item_updater                            SKIP     0.00 s
Ok:                    0
Skipped:               2

The log shows that `Not run because can not execute cross compiled binaries,
while the test actually could be run on x86-64 host, because we are cross
compiling x86-64 on a x86-64 host.

2. If we use the latest OpenBMC SDK, the above issue is gone because it uses a
newer version of meson and it somehow does not think the test is cross-compiled
anymore.
However, if we are using the ARM SDK, and run the meson build and test, it will
still run the arm binaries and got a failure:

OSError: [Errno 8] Exec format error:
'/home/leiyu/work/phosphor-psu-code-mgmt/build/test/test_util'
FAILED: meson-test


So I come up with the below patch, as the concept of making meson to run the
test only if the test case is compatible with the build machine.

```
diff --git a/mesonbuild/mtest.py b/mesonbuild/mtest.py
index 1dca0759..52a01ba3 100644
--- a/mesonbuild/mtest.py
+++ b/mesonbuild/mtest.py
@@ -441,6 +441,20 @@ def load_tests(build_dir: str) ->
typing.List['TestSerialisation']:
         obj = typing.cast(typing.List['TestSerialisation'], pickle.load(f))
     return obj

+def is_compatible(test_case):
+    from subprocess import Popen, PIPE, STDOUT
+    cmd = 'file ' + test_case[0]
+    p = Popen(cmd, shell=True, stdin=PIPE, stdout=PIPE,
stderr=STDOUT, close_fds=True)
+    output = p.stdout.read().decode('utf-8')
+    splitted = output.split(',')
+    test_arch = splitted[1].strip()
+    test_arch = test_arch.replace('-', '_')
+
+    import platform
+    build_machine_arch = platform.machine()
+    build_machine_arch = build_machine_arch.replace('-', '_')
+
+    return test_arch == build_machine_arch

 class SingleTestRunner:

@@ -457,7 +471,7 @@ class SingleTestRunner:
         elif not self.test.is_cross_built and
run_with_mono(self.test.fname[0]):
             return ['mono'] + self.test.fname
         else:
-            if self.test.is_cross_built:
+            if self.test.is_cross_built or not is_compatible(self.test.fname):
                 if self.test.exe_runner is None:
                     # Can not run test on cross compiled executable
                     # because there is no execute wrapper.
```


The idea here is to check if the test binary's architecture by `file` command,
compare it with the build machine's architecture, and return the test case if
they match.

With the patch, the meson unit test works well:
* If using x86-64 SDK, it runs the tests and reports the result correctly:
1/2 util                                    OK       0.02 s
2/2 item_updater                            OK       0.02 s
Ok:                    2
* If using ARM SDK, it skips the tests:
1/2 util                                    SKIP     0.00 s
2/2 item_updater                            SKIP     0.00 s
Skipped:               2

So I am asking comments here:
1. Does the patch make sense? (If yes, I would like to push it to
meson upstream)
2. Is there a better way to check if test case is really cross-compiled or not?
   Likely it is better to be fixed in `backend/backends.py`
   `serialize_executable()` function, which really set the `test.is_cross_built`
   property.
